import 'package:mise/core/error/failure.dart';
import 'package:mise/core/error/result.dart';
import 'package:mise/core/utils/app_logger.dart';
import 'package:mise/core/utils/async_pool.dart';
import 'package:mise/features/recipes/controllers/recipe_controller.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pantry_controller.g.dart';

/// Every ingredient TheMealDB knows, loaded once per session.
@Riverpod(keepAlive: true)
class IngredientCatalogController extends _$IngredientCatalogController {
  @override
  Future<List<CatalogIngredient>> build() async =>
      (await ref.watch(pantryRepositoryProvider).getCatalog()).getOrThrow();

  void retry() => ref.invalidateSelf();
}

/// What the user has at home, kept on the device, in the order added.
///
/// Every change shows at once and rolls back if saving fails.
@Riverpod(keepAlive: true)
class PantryController extends _$PantryController {
  @override
  Future<List<String>> build() async =>
      (await ref.read(pantryRepositoryProvider).getPantry()).getOrThrow();

  List<String> get _current => state.value ?? const [];

  Future<void> add(String ingredient) {
    final exists = _current.any(
      (name) => name.toLowerCase() == ingredient.toLowerCase(),
    );
    return exists ? Future.value() : _save([..._current, ingredient]);
  }

  Future<void> remove(String ingredient) => _save([
    for (final name in _current)
      if (name != ingredient) name,
  ]);

  Future<void> clear() => _save(const []);

  /// Puts back a previous pantry, to undo a removal or a clear.
  Future<void> restore(List<String> ingredients) => _save(ingredients);

  Future<void> _save(List<String> next) async {
    final previous = _current;
    state = AsyncData(List.unmodifiable(next));
    final result = await ref.read(pantryRepositoryProvider).savePantry(next);
    if (result case Err(:final failure)) {
      state = AsyncData(previous);
      throw failure;
    }
  }
}

/// Recipes that use one catalog ingredient. Kept per ingredient, so adding
/// another to the pantry doesn't fetch the rest again.
@Riverpod(keepAlive: true)
Future<List<RecipeSummary>> recipesWithIngredient(
  Ref ref,
  String ingredient,
) async =>
    (await ref
            .watch(pantryRepositoryProvider)
            .getRecipesWithIngredient(ingredient))
        .getOrThrow();

/// How many of the best matches get their full recipe looked up, to tell
/// what is missing.
const pantryLookups = 12;

/// At most this many matches are shown.
const pantryMaxMatches = 30;

/// Requests in flight at once: TheMealDB answers bursts with 429.
const _maxConcurrentRequests = 4;

/// Recipes to cook with the pantry: ready ones first, then those missing
/// little, then more ideas.
///
/// The free API filters by one ingredient at a time, so this fetches each
/// pantry ingredient (and its catalog variants) and ranks recipes by how
/// many they use.
@riverpod
class PantryMatchesController extends _$PantryMatchesController {
  @override
  Future<List<PantryMatch>> build() async {
    final pantry = await ref.watch(pantryControllerProvider.future);
    if (pantry.isEmpty) return const [];

    final catalog = ref.watch(ingredientCatalogControllerProvider).value;
    final found = await mapWithLimit(
      pantry,
      (ingredient) => _recipesFor(ingredient, catalog),
      limit: _maxConcurrentRequests,
    );
    final ranked = rankPantryMatches({
      for (final (index, ingredient) in pantry.indexed)
        ingredient: found[index],
    }).take(pantryMaxMatches).toList();

    final lookedUp = await mapWithLimit(
      ranked.take(pantryLookups),
      (match) => _withMissing(match, pantry),
      limit: _maxConcurrentRequests,
    );
    return List.unmodifiable(
      sortByFit([...lookedUp, ...ranked.skip(pantryLookups)]),
    );
  }

  /// Fetches everything again, including ingredients that failed.
  void retry() {
    for (final ingredient
        in ref.read(pantryControllerProvider).value ?? const <String>[]) {
      ref.invalidate(recipesWithIngredientProvider(ingredient));
    }
    ref.invalidateSelf();
  }

  Future<List<RecipeSummary>> _recipesFor(
    String ingredient,
    List<CatalogIngredient>? catalog,
  ) async {
    final variants = catalog == null
        ? [ingredient]
        : catalogVariants(ingredient, catalog);
    // Sequential: variants are few, and ingredients already run in parallel.
    final results = [
      for (final name in variants)
        await ref.watch(recipesWithIngredientProvider(name).future),
    ];
    return {
      for (final recipe in results.expand((recipes) => recipes))
        recipe.id: recipe,
    }.values.toList();
  }

  /// [match] with what's missing, or unchanged when the lookup fails: the
  /// match is still worth showing.
  Future<PantryMatch> _withMissing(
    PantryMatch match,
    List<String> pantry,
  ) async {
    try {
      final lookup = await ref.watch(
        recipeControllerProvider(match.recipe.id).future,
      );
      return match.copyWith(missing: missingFromPantry(lookup.recipe, pantry));
    } on Failure catch (failure) {
      AppLogger.warning('No details for ${match.recipe.id}', failure);
      return match;
    }
  }
}
