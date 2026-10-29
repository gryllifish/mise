import 'package:mise/core/error/result.dart';
import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

/// A recipe and whether it came from the saved copy instead of the network.
typedef RecipeLookup = ({Recipe recipe, bool isSavedCopy});

/// Source of truth for browsing and reading recipes.
abstract interface class RecipesRepository {
  Future<Result<List<RecipeCategory>>> getCategories();

  Future<Result<List<RecipeSummary>>> getRecipesInCategory(String category);

  /// Cuisines to browse by, most recipes first.
  Future<Result<List<Cuisine>>> getCuisines();

  Future<Result<List<RecipeSummary>>> getRecipesInCuisine(String cuisine);

  /// Recipes whose name matches [query]. A [cancel] signal drops the
  /// request when a newer search replaces it.
  Future<Result<List<RecipeSummary>>> searchRecipes(
    String query, {
    CancelSignal? cancel,
  });

  /// The recipe with [id]. When the network fails but the recipe is saved,
  /// returns the saved copy instead of a failure.
  Future<Result<RecipeLookup>> getRecipe(String id);

  /// A random recipe to feature.
  Future<Result<Recipe>> getRandomRecipe();
}

/// Recipes the user kept on this device.
abstract interface class SavedRecipesRepository {
  /// Most recently saved first.
  Future<Result<List<Recipe>>> getSavedRecipes();

  Future<Result<void>> saveRecipe(Recipe recipe);

  Future<Result<void>> removeRecipe(String id);
}

/// What the user has at home, and recipes that use it.
abstract interface class PantryRepository {
  /// Every ingredient TheMealDB knows, to pick from.
  Future<Result<List<CatalogIngredient>>> getCatalog();

  /// Recipes that use [ingredient], a catalog name.
  Future<Result<List<RecipeSummary>>> getRecipesWithIngredient(
    String ingredient,
  );

  /// Pantry ingredient names, in the order they were added.
  Future<Result<List<String>>> getPantry();

  /// Replaces the whole pantry; it is small, so one write covers adding,
  /// removing, clearing and undoing.
  Future<Result<void>> savePantry(List<String> ingredients);
}
