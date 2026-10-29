import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/data/models/meal_dto.dart';

import '../../../../helpers/recipe_fixtures.dart';

void main() {
  final json =
      (jsonDecode(File('test/fixtures/meal_lookup.json').readAsStringSync())
              as Map<String, dynamic>)['meals']
          as List<dynamic>;
  final dto = MealDto.fromJson(json.single as Map<String, dynamic>);

  test('folds the 20 numbered ingredient fields into a list', () {
    expect(dto.ingredients, hasLength(9));
    expect(
      dto.ingredients.first,
      const IngredientDto(name: 'soy sauce', measure: '3/4 cup'),
    );
  });

  test('maps a real API meal into a cookable recipe', () {
    final recipe = dto.toEntity();

    expect(recipe.name, 'Teriyaki Chicken Casserole');
    expect(recipe.category, 'Chicken');
    expect(recipe.area, isNotEmpty);
    expect(recipe.steps.length, greaterThan(1));
    expect(recipe.thumbnailUrl, '${recipe.imageUrl}/medium');
  });

  test('each ingredient gets its TheMealDB cut-out photo', () {
    expect(
      dto.toEntity().ingredients.first.imageUrl,
      'https://www.themealdb.com/images/ingredients/soy%20sauce-small.png',
    );
  });

  test('a saved copy round-trips to the same recipe', () {
    final saved = sampleRecipe.toSavedDto(savedAt: DateTime(2026));

    expect(saved.toEntity(), sampleRecipe);
  });
}
