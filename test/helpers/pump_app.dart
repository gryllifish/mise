import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mise/app/app.dart';
import 'package:mise/app/app_router.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/error/result.dart';
import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:mise/shared/providers/clock_provider.dart';
import 'package:mise/shared/providers/image_loader_provider.dart';
import 'package:mise/shared/widgets/app_bottom_nav.dart';

import 'recipe_fixtures.dart';

/// Recipes for the whole app, named after where they come from so tests
/// can tell a category grid from search results.
class FakeRecipesRepository implements RecipesRepository {
  /// When set, every call fails with it.
  Failure? failure;

  /// Whether lookups come back as the saved copy, as when offline.
  bool isSavedCopy = false;

  /// Queries searched for, in order.
  final searches = <String>[];

  Result<T> _answer<T>(T value) => switch (failure) {
    final Failure failure => Err(failure),
    null => Ok(value),
  };

  @override
  Future<Result<List<RecipeCategory>>> getCategories() async =>
      _answer(sampleCategories);

  @override
  Future<Result<List<RecipeSummary>>> getRecipesInCategory(
    String category,
  ) async => _answer([
    for (final n in [1, 2, 3])
      buildRecipe(id: '$category-$n', name: '$category dish $n').summary,
  ]);

  @override
  Future<Result<List<Cuisine>>> getCuisines() async => _answer(const [
    Cuisine(name: 'Spanish', flag: '🇪🇸'),
    Cuisine(name: 'Japanese', flag: '🇯🇵'),
  ]);

  @override
  Future<Result<List<RecipeSummary>>> getRecipesInCuisine(
    String cuisine,
  ) async => _answer([
    for (final n in [1, 2])
      buildRecipe(id: '$cuisine-$n', name: '$cuisine plate $n').summary,
  ]);

  @override
  Future<Result<List<RecipeSummary>>> searchRecipes(
    String query, {
    CancelSignal? cancel,
  }) async {
    searches.add(query);
    return _answer([
      if (query != 'nothing')
        buildRecipe(id: 'found', name: 'Found $query').summary,
    ]);
  }

  @override
  Future<Result<RecipeLookup>> getRecipe(String id) async =>
      _answer((recipe: buildRecipe(id: id), isSavedCopy: isSavedCopy));

  @override
  Future<Result<Recipe>> getRandomRecipe() async => _answer(sampleRecipe);
}

/// Saved recipes kept in memory, most recent first.
class FakeSavedRecipesRepository implements SavedRecipesRepository {
  /// When set, saving and removing fail with it.
  Failure? failure;

  final saved = <Recipe>[];

  Result<void> _write(void Function() change) => switch (failure) {
    final Failure failure => Err(failure),
    null => Ok(change()),
  };

  @override
  Future<Result<List<Recipe>>> getSavedRecipes() async =>
      Ok(List.unmodifiable(saved));

  @override
  Future<Result<void>> saveRecipe(Recipe recipe) async =>
      _write(() => saved.insert(0, recipe));

  @override
  Future<Result<void>> removeRecipe(String id) async =>
      _write(() => saved.removeWhere((recipe) => recipe.id == id));
}

/// A small catalog and pantry. Recipes use the catalog names they are
/// filed under: "Rice bowl" uses rice; "Garlic rice" uses rice and
/// garlic; "Eggs" and "Egg" are variants, like in TheMealDB.
class FakePantryRepository implements PantryRepository {
  /// When set, saving the pantry fails with it.
  Failure? saveFailure;

  /// When set, finding recipes fails with it.
  Failure? searchFailure;

  /// What is saved, in order.
  final pantry = <String>[];

  /// Catalog names searched for, in order.
  final searches = <String>[];

  static final Map<String, List<RecipeSummary>> _recipes = {
    'Rice': [_summary('rice-bowl', 'Rice bowl'), _summary('garlic-rice')],
    'Garlic': [_summary('garlic-rice')],
    'Eggs': [_summary('omelette', 'Omelette')],
    'Egg': [_summary('fried-egg', 'Fried egg')],
  };

  static RecipeSummary _summary(String id, [String? name]) =>
      buildRecipe(id: id, name: name ?? 'Garlic rice').summary;

  @override
  Future<Result<List<CatalogIngredient>>> getCatalog() async => Ok([
    for (final name in ['Rice', 'Garlic', 'Eggs', 'Egg', 'Salmon', 'Lemon'])
      CatalogIngredient(name: name, imageUrl: ingredientImageUrl(name)),
  ]);

  @override
  Future<Result<List<RecipeSummary>>> getRecipesWithIngredient(
    String ingredient,
  ) async {
    searches.add(ingredient);
    return switch (searchFailure) {
      final Failure failure => Err(failure),
      null => Ok(_recipes[ingredient] ?? const []),
    };
  }

  @override
  Future<Result<List<String>>> getPantry() async =>
      Ok(List.unmodifiable(pantry));

  @override
  Future<Result<void>> savePantry(List<String> ingredients) async {
    if (saveFailure case final Failure failure) return Err(failure);
    pantry
      ..clear()
      ..addAll(ingredients);
    return const Ok<void>(null);
  }
}

/// A 1×1 transparent PNG standing in for every network photo.
final Uint8List _transparentPixel = Uint8List.fromList(const [
  137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 1, //
  0, 0, 0, 1, 8, 6, 0, 0, 0, 31, 21, 196, 137, 0, 0, 0, 11, 73, 68, 65, 84,
  120, 156, 99, 96, 0, 2, 0, 0, 5, 0, 1, 122, 94, 171, 63, 0, 0, 0, 0, 73,
  69, 78, 68, 174, 66, 96, 130,
]);

/// Logical size of a typical phone.
const phoneSize = Size(393, 852);

/// Pumps the whole app (real router and screens) on fake data, at a
/// logical [size] that defaults to a phone.
///
/// [reduceMotion] turns on the OS setting; cook mode needs it in tests,
/// since its slow photo zoom never settles.
Future<void> pumpApp(
  WidgetTester tester, {
  Size size = phoneSize,
  FakeRecipesRepository? recipes,
  FakeSavedRecipesRepository? saved,
  FakePantryRepository? pantry,
  bool reduceMotion = false,
}) async {
  if (reduceMotion) {
    tester.platformDispatcher.accessibilityFeaturesTestValue =
        const FakeAccessibilityFeatures(disableAnimations: true);
    addTearDown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
  }
  tester.view
    ..physicalSize = size * 3
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        recipesRepositoryProvider.overrideWithValue(
          recipes ?? FakeRecipesRepository(),
        ),
        savedRecipesRepositoryProvider.overrideWithValue(
          saved ?? FakeSavedRecipesRepository(),
        ),
        pantryRepositoryProvider.overrideWithValue(
          pantry ?? FakePantryRepository(),
        ),
        imageLoaderProvider.overrideWithValue(
          (_) => MemoryImage(_transparentPixel),
        ),
        // Fake time, so timers advance with tester.pump.
        clockProvider.overrideWithValue(() => tester.binding.clock.now()),
      ],
      // Riverpod retries failed providers by default; tests want the raw
      // error on screen.
      retry: (_, _) => null,
      child: const App(),
    ),
  );
  await tester.pumpAndSettle();
}

/// The router of the app pumped by [pumpApp], to navigate like a deep link.
GoRouter routerOf(WidgetTester tester) => ProviderScope.containerOf(
  tester.element(find.byType(App)),
).read(appRouterProvider);

/// Scrolls the page (not a nested horizontal list) until [finder] shows
/// above the bottom bar, which content scrolls under.
Future<void> scrollTo(WidgetTester tester, Finder finder) async {
  final page = find.byType(Scrollable).first;
  await tester.scrollUntilVisible(finder, 200, scrollable: page);
  await tester.drag(page, const Offset(0, -AppBottomNav.height * 2));
  await tester.pumpAndSettle();
}
