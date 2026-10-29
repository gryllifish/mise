import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_dto.freezed.dart';
part 'meal_dto.g.dart';

/// A full meal from TheMealDB (`lookup.php`, `search.php`, `random.php`).
///
/// The API spreads ingredients over 20 numbered field pairs
/// (`strIngredient1`/`strMeasure1` … `20`); [readIngredients] folds them
/// into a list while parsing.
@freezed
abstract class MealDto with _$MealDto {
  const factory MealDto({
    @JsonKey(name: 'idMeal') required String id,
    @JsonKey(name: 'strMeal') required String name,
    @JsonKey(name: 'strCategory') required String? category,
    @JsonKey(name: 'strArea') required String? area,
    @JsonKey(name: 'strInstructions') required String? instructions,
    @JsonKey(name: 'strMealThumb') required String thumbnailUrl,
    @JsonKey(readValue: readIngredients)
    required List<IngredientDto> ingredients,
  }) = _MealDto;

  factory MealDto.fromJson(Map<String, dynamic> json) =>
      _$MealDtoFromJson(json);
}

@freezed
abstract class IngredientDto with _$IngredientDto {
  const factory IngredientDto({
    required String name,
    required String measure,
  }) = _IngredientDto;

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);
}

/// Collects the numbered ingredient fields, skipping blank slots.
@visibleForTesting
List<Map<String, String>> readIngredients(Map<dynamic, dynamic> json, _) {
  const maxIngredients = 20;
  return [
    for (var i = 1; i <= maxIngredients; i++)
      if ((json['strIngredient$i'] as String? ?? '').trim() case final name
          when name.isNotEmpty)
        {
          'name': name,
          'measure': (json['strMeasure$i'] as String? ?? '').trim(),
        },
  ];
}

/// A meal as listed by `filter.php` (id, name and photo only).
@freezed
abstract class MealSummaryDto with _$MealSummaryDto {
  const factory MealSummaryDto({
    @JsonKey(name: 'idMeal') required String id,
    @JsonKey(name: 'strMeal') required String name,
    @JsonKey(name: 'strMealThumb') required String thumbnailUrl,
  }) = _MealSummaryDto;

  factory MealSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$MealSummaryDtoFromJson(json);
}

/// A category from `categories.php`.
@freezed
abstract class CategoryDto with _$CategoryDto {
  const factory CategoryDto({
    @JsonKey(name: 'strCategory') required String name,
    @JsonKey(name: 'strCategoryThumb') required String thumbnailUrl,
  }) = _CategoryDto;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}

/// One row of `list.php?i=list`, TheMealDB's ingredient catalog.
@freezed
abstract class CatalogIngredientDto with _$CatalogIngredientDto {
  const factory CatalogIngredientDto({
    @JsonKey(name: 'strIngredient') required String name,
  }) = _CatalogIngredientDto;

  factory CatalogIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogIngredientDtoFromJson(json);
}
