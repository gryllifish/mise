// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedRecipeDto _$SavedRecipeDtoFromJson(Map<String, dynamic> json) =>
    _SavedRecipeDto(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      area: json['area'] as String,
      imageUrl: json['image_url'] as String,
      thumbnailUrl: json['thumbnail_url'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => SavedIngredientDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      savedAt: DateTime.parse(json['saved_at'] as String),
    );

Map<String, dynamic> _$SavedRecipeDtoToJson(_SavedRecipeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'area': instance.area,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'steps': instance.steps,
      'saved_at': instance.savedAt.toIso8601String(),
    };

_SavedIngredientDto _$SavedIngredientDtoFromJson(Map<String, dynamic> json) =>
    _SavedIngredientDto(
      name: json['name'] as String,
      measure: json['measure'] as String,
    );

Map<String, dynamic> _$SavedIngredientDtoToJson(_SavedIngredientDto instance) =>
    <String, dynamic>{'name': instance.name, 'measure': instance.measure};
