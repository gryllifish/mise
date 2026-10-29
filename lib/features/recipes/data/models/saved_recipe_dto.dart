import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipe_dto.freezed.dart';
part 'saved_recipe_dto.g.dart';

/// How a saved recipe is stored on the device.
///
/// Mirrors the entity rather than the API, so stored data survives API
/// format quirks and needs no re-parsing of instructions.
@freezed
abstract class SavedRecipeDto with _$SavedRecipeDto {
  const factory SavedRecipeDto({
    required String id,
    required String name,
    required String category,
    required String area,
    required String imageUrl,
    required String thumbnailUrl,
    required List<SavedIngredientDto> ingredients,
    required List<String> steps,
    required DateTime savedAt,
  }) = _SavedRecipeDto;

  factory SavedRecipeDto.fromJson(Map<String, dynamic> json) =>
      _$SavedRecipeDtoFromJson(json);
}

@freezed
abstract class SavedIngredientDto with _$SavedIngredientDto {
  const factory SavedIngredientDto({
    required String name,
    required String measure,
  }) = _SavedIngredientDto;

  factory SavedIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$SavedIngredientDtoFromJson(json);
}
