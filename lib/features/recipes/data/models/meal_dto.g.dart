// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealDto _$MealDtoFromJson(Map<String, dynamic> json) => _MealDto(
  id: json['idMeal'] as String,
  name: json['strMeal'] as String,
  category: json['strCategory'] as String?,
  area: json['strArea'] as String?,
  instructions: json['strInstructions'] as String?,
  thumbnailUrl: json['strMealThumb'] as String,
  ingredients: (readIngredients(json, 'ingredients') as List<dynamic>)
      .map((e) => IngredientDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MealDtoToJson(_MealDto instance) => <String, dynamic>{
  'idMeal': instance.id,
  'strMeal': instance.name,
  'strCategory': instance.category,
  'strArea': instance.area,
  'strInstructions': instance.instructions,
  'strMealThumb': instance.thumbnailUrl,
  'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
};

_IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) =>
    _IngredientDto(
      name: json['name'] as String,
      measure: json['measure'] as String,
    );

Map<String, dynamic> _$IngredientDtoToJson(_IngredientDto instance) =>
    <String, dynamic>{'name': instance.name, 'measure': instance.measure};

_MealSummaryDto _$MealSummaryDtoFromJson(Map<String, dynamic> json) =>
    _MealSummaryDto(
      id: json['idMeal'] as String,
      name: json['strMeal'] as String,
      thumbnailUrl: json['strMealThumb'] as String,
    );

Map<String, dynamic> _$MealSummaryDtoToJson(_MealSummaryDto instance) =>
    <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.name,
      'strMealThumb': instance.thumbnailUrl,
    };

_CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => _CategoryDto(
  name: json['strCategory'] as String,
  thumbnailUrl: json['strCategoryThumb'] as String,
);

Map<String, dynamic> _$CategoryDtoToJson(_CategoryDto instance) =>
    <String, dynamic>{
      'strCategory': instance.name,
      'strCategoryThumb': instance.thumbnailUrl,
    };

_CatalogIngredientDto _$CatalogIngredientDtoFromJson(
  Map<String, dynamic> json,
) => _CatalogIngredientDto(name: json['strIngredient'] as String);

Map<String, dynamic> _$CatalogIngredientDtoToJson(
  _CatalogIngredientDto instance,
) => <String, dynamic>{'strIngredient': instance.name};
