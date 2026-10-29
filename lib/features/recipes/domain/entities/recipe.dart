import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

/// A full recipe, ready to cook.
@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required String category,

    /// Cuisine of origin, e.g. "Italian".
    required String area,

    /// Full-size photo, for the detail screen.
    required String imageUrl,

    /// Smaller photo, for cards and lists.
    required String thumbnailUrl,
    required List<Ingredient> ingredients,

    /// Instructions split into one action per step.
    required List<String> steps,
  }) = _Recipe;

  const Recipe._();

  RecipeSummary get summary =>
      RecipeSummary(id: id, name: name, thumbnailUrl: thumbnailUrl);
}

/// One line of a recipe's ingredient list.
@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String name,

    /// Free-form quantity as written by the author, e.g. "1/2 cup".
    required String measure,

    /// Cut-out photo of the ingredient on a transparent background.
    required String imageUrl,
  }) = _Ingredient;
}

/// What lists need to show a recipe card.
@freezed
abstract class RecipeSummary with _$RecipeSummary {
  const factory RecipeSummary({
    required String id,
    required String name,
    required String thumbnailUrl,
  }) = _RecipeSummary;
}

/// A recipe category, e.g. "Dessert".
@freezed
abstract class RecipeCategory with _$RecipeCategory {
  const factory RecipeCategory({
    required String name,
    required String thumbnailUrl,
  }) = _RecipeCategory;
}

/// A cuisine, by TheMealDB's demonym for it, e.g. "Spanish".
@freezed
abstract class Cuisine with _$Cuisine {
  const factory Cuisine({
    required String name,

    /// Flag emoji of its country.
    required String flag,
  }) = _Cuisine;
}
