import 'package:mise/core/error/result.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_recipes_controller.g.dart';

/// Recipes saved on this device, most recent first.
@Riverpod(keepAlive: true)
class SavedRecipesController extends _$SavedRecipesController {
  @override
  Future<List<Recipe>> build() async =>
      (await ref.read(savedRecipesRepositoryProvider).getSavedRecipes())
          .getOrThrow();

  /// Saves [recipe], or removes it if it is already saved.
  Future<void> toggle(Recipe recipe) async {
    final repository = ref.read(savedRecipesRepositoryProvider);
    final saved = state.value ?? const <Recipe>[];
    final isSaved = saved.any((item) => item.id == recipe.id);

    // Optimistic: the heart fills right away and rolls back on failure.
    state = AsyncData(
      isSaved
          ? [
              for (final item in saved)
                if (item.id != recipe.id) item,
            ]
          : [recipe, ...saved],
    );
    final result = isSaved
        ? await repository.removeRecipe(recipe.id)
        : await repository.saveRecipe(recipe);
    if (result case Err(:final failure)) {
      state = AsyncData(saved);
      throw failure;
    }
  }
}

/// Whether the recipe with [id] is saved.
@riverpod
bool isRecipeSaved(Ref ref, String id) =>
    ref
        .watch(savedRecipesControllerProvider)
        .value
        ?.any((recipe) => recipe.id == id) ??
    false;
