import 'package:mise/features/recipes/data/mappers/instructions_parser.dart';
import 'package:mise/features/recipes/data/models/meal_dto.dart';
import 'package:mise/features/recipes/data/models/saved_recipe_dto.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

/// TheMealDB serves smaller copies of each photo under these suffixes.
String _thumbnail(String imageUrl) => '$imageUrl/medium';

/// TheMealDB has a cut-out photo for each catalog ingredient, by name
/// (case-insensitive). Unknown names 404, and the image shows a fallback.
String ingredientImageUrl(String name) =>
    'https://www.themealdb.com/images/ingredients/'
    '${Uri.encodeComponent(name.trim())}-small.png';

extension MealDtoMapper on MealDto {
  Recipe toEntity() => Recipe(
    id: id,
    name: name.trim(),
    category: category?.trim() ?? '',
    area: area?.trim() ?? '',
    imageUrl: thumbnailUrl,
    thumbnailUrl: _thumbnail(thumbnailUrl),
    ingredients: List.unmodifiable(
      ingredients.map(
        (ingredient) => Ingredient(
          name: ingredient.name,
          measure: ingredient.measure,
          imageUrl: ingredientImageUrl(ingredient.name),
        ),
      ),
    ),
    steps: List.unmodifiable(splitInstructions(instructions)),
  );
}

extension MealSummaryDtoMapper on MealSummaryDto {
  RecipeSummary toEntity() => RecipeSummary(
    id: id,
    name: name.trim(),
    thumbnailUrl: _thumbnail(thumbnailUrl),
  );
}

extension CategoryDtoMapper on CategoryDto {
  RecipeCategory toEntity() =>
      RecipeCategory(name: name, thumbnailUrl: thumbnailUrl);
}

extension SavedRecipeDtoMapper on SavedRecipeDto {
  Recipe toEntity() => Recipe(
    id: id,
    name: name,
    category: category,
    area: area,
    imageUrl: imageUrl,
    thumbnailUrl: thumbnailUrl,
    ingredients: List.unmodifiable(
      ingredients.map(
        (ingredient) => Ingredient(
          name: ingredient.name,
          measure: ingredient.measure,
          imageUrl: ingredientImageUrl(ingredient.name),
        ),
      ),
    ),
    steps: List.unmodifiable(steps),
  );
}

extension RecipeToSavedDto on Recipe {
  SavedRecipeDto toSavedDto({required DateTime savedAt}) => SavedRecipeDto(
    id: id,
    name: name,
    category: category,
    area: area,
    imageUrl: imageUrl,
    thumbnailUrl: thumbnailUrl,
    ingredients: [
      for (final ingredient in ingredients)
        SavedIngredientDto(name: ingredient.name, measure: ingredient.measure),
    ],
    steps: steps,
    savedAt: savedAt,
  );
}

extension CatalogIngredientDtoMapper on CatalogIngredientDto {
  CatalogIngredient toEntity() => CatalogIngredient(
    name: name.trim(),
    imageUrl: ingredientImageUrl(name),
  );
}
