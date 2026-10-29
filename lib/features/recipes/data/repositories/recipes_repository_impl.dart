import 'package:mise/core/error/guard.dart';
import 'package:mise/core/error/result.dart';
import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/data/datasources/known_cuisines.dart';
import 'package:mise/features/recipes/data/datasources/pantry_local_data_source.dart';
import 'package:mise/features/recipes/data/datasources/recipes_remote_data_source.dart';
import 'package:mise/features/recipes/data/datasources/saved_recipes_local_data_source.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:mise/shared/providers/clock_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_repository_impl.g.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  const RecipesRepositoryImpl(this._remote, this._saved);

  final RecipesRemoteDataSource _remote;
  final SavedRecipesLocalDataSource _saved;

  @override
  Future<Result<List<RecipeCategory>>> getCategories() => guard(() async {
    final dtos = await _remote.fetchCategories();
    return List<RecipeCategory>.unmodifiable(dtos.map((dto) => dto.toEntity()));
  });

  @override
  Future<Result<List<RecipeSummary>>> getRecipesInCategory(String category) =>
      guard(() async {
        final dtos = await _remote.fetchMealsInCategory(category);
        return List<RecipeSummary>.unmodifiable(
          dtos.map((dto) => dto.toEntity()),
        );
      });

  @override
  Future<Result<List<Cuisine>>> getCuisines() async => Ok(
    List<Cuisine>.unmodifiable([
      for (final (:name, :flag) in knownCuisines)
        Cuisine(name: name, flag: flag),
    ]),
  );

  @override
  Future<Result<List<RecipeSummary>>> getRecipesInCuisine(String cuisine) =>
      guard(() async {
        final dtos = await _remote.fetchMealsInCuisine(cuisine);
        return List<RecipeSummary>.unmodifiable(
          dtos.map((dto) => dto.toEntity()),
        );
      });

  @override
  Future<Result<List<RecipeSummary>>> searchRecipes(
    String query, {
    CancelSignal? cancel,
  }) => guard(() async {
    final dtos = await _remote.searchMeals(query, cancel: cancel);
    return List<RecipeSummary>.unmodifiable(
      dtos.map((dto) => dto.toEntity().summary),
    );
  });

  @override
  Future<Result<RecipeLookup>> getRecipe(String id) async {
    final remote = await guard(() async {
      final dto = await _remote.fetchMeal(id);
      return dto.toEntity();
    });
    return switch (remote) {
      Ok(:final value) => Ok((recipe: value, isSavedCopy: false)),
      Err(:final failure) when failure.isTransient => _savedCopyOr(id, remote),
      Err(:final failure) => Err(failure),
    };
  }

  /// The saved copy of [id], or the original network failure.
  Future<Result<RecipeLookup>> _savedCopyOr(
    String id,
    Err<Recipe> networkError,
  ) async {
    final saved = await guard(() async => _saved.read(id)?.toEntity());
    return switch (saved) {
      Ok(value: final Recipe recipe) => Ok((recipe: recipe, isSavedCopy: true)),
      _ => Err(networkError.failure),
    };
  }

  @override
  Future<Result<Recipe>> getRandomRecipe() => guard(() async {
    final dto = await _remote.fetchRandomMeal();
    return dto.toEntity();
  });
}

class SavedRecipesRepositoryImpl implements SavedRecipesRepository {
  const SavedRecipesRepositoryImpl(this._local, this._now);

  final SavedRecipesLocalDataSource _local;
  final DateTime Function() _now;

  @override
  Future<Result<List<Recipe>>> getSavedRecipes() => guard(() async {
    final dtos = _local.readAll()
      ..sort((a, b) => b.savedAt.compareTo(a.savedAt));
    return List<Recipe>.unmodifiable(dtos.map((dto) => dto.toEntity()));
  });

  @override
  Future<Result<void>> saveRecipe(Recipe recipe) =>
      guard(() => _local.write(recipe.toSavedDto(savedAt: _now())));

  @override
  Future<Result<void>> removeRecipe(String id) =>
      guard(() => _local.delete(id));
}

class PantryRepositoryImpl implements PantryRepository {
  const PantryRepositoryImpl(this._remote, this._local);

  final RecipesRemoteDataSource _remote;
  final PantryLocalDataSource _local;

  @override
  Future<Result<List<CatalogIngredient>>> getCatalog() => guard(() async {
    final dtos = await _remote.fetchIngredientCatalog();
    return List<CatalogIngredient>.unmodifiable(
      dtos.map((dto) => dto.toEntity()),
    );
  });

  @override
  Future<Result<List<RecipeSummary>>> getRecipesWithIngredient(
    String ingredient,
  ) => guard(() async {
    final dtos = await _remote.fetchMealsWithIngredient(ingredient);
    return List<RecipeSummary>.unmodifiable(dtos.map((dto) => dto.toEntity()));
  });

  @override
  Future<Result<List<String>>> getPantry() =>
      guard(() async => List<String>.unmodifiable(_local.read()));

  @override
  Future<Result<void>> savePantry(List<String> ingredients) =>
      guard(() => _local.write(ingredients));
}

/// Exposes the interfaces, so tests and controllers depend on abstractions.
@riverpod
RecipesRepository recipesRepository(Ref ref) => RecipesRepositoryImpl(
  ref.watch(recipesRemoteDataSourceProvider),
  ref.watch(savedRecipesLocalDataSourceProvider),
);

@riverpod
SavedRecipesRepository savedRecipesRepository(Ref ref) =>
    SavedRecipesRepositoryImpl(
      ref.watch(savedRecipesLocalDataSourceProvider),
      ref.watch(clockProvider),
    );

@riverpod
PantryRepository pantryRepository(Ref ref) => PantryRepositoryImpl(
  ref.watch(recipesRemoteDataSourceProvider),
  ref.watch(pantryLocalDataSourceProvider),
);
