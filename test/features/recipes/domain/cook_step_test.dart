import 'package:flutter_test/flutter_test.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/data/models/meal_dto.dart';
import 'package:mise/features/recipes/domain/entities/cook_step.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

import '../../../helpers/fixtures.dart';

Ingredient _ingredient(String name) =>
    Ingredient(name: name, measure: '1', imageUrl: ingredientImageUrl(name));

List<String> _names(String step, List<String> ingredients) => [
  for (final ingredient in mentionedIngredients(step, [
    for (final name in ingredients) _ingredient(name),
  ]))
    ingredient.name,
];

void main() {
  group('mentionedIngredients', () {
    test('matches full names and their last word', () {
      expect(
        _names('Combine soy sauce, water, ginger and garlic in a pan.', [
          'soy sauce',
          'water',
          'ground ginger',
          'minced garlic',
          'brown rice',
        ]),
        ['soy sauce', 'water', 'ground ginger', 'minced garlic'],
      );
    });

    test('ignores case, punctuation and plurals', () {
      expect(
        _names('Dice the TOMATOES; add 2 berries and an onion.', [
          'Tomato',
          'Berry',
          'Onions',
        ]),
        ['Tomato', 'Berry', 'Onions'],
      );
    });

    test('does not match parts of other words', () {
      expect(
        _names('Bring to a boil and stir.', ['olive oil', 'rice']),
        <String>[],
      );
    });

    test('works on a real recipe', () {
      final meal = MealDto.fromJson(
        (fixtureJson('meal_lookup')['meals'] as List<dynamic>).single
            as Map<String, dynamic>,
      );
      final steps = meal.toEntity().cookSteps;

      expect(
        steps[1].ingredients.map((ingredient) => ingredient.name),
        containsAll(['soy sauce', 'water', 'brown sugar', 'ground ginger']),
      );
    });
  });

  group('mentionedDuration', () {
    test('reads numbers and units', () {
      expect(
        mentionedDuration('Bake for 25 minutes.'),
        const Duration(minutes: 25),
      );
      expect(mentionedDuration('Rest 2 hrs.'), const Duration(hours: 2));
      expect(mentionedDuration('Whisk 30 secs'), const Duration(seconds: 30));
      expect(mentionedDuration('Roast 1.5 hours'), const Duration(minutes: 90));
    });

    test('reads number words', () {
      expect(
        mentionedDuration('Cook for one minute.'),
        const Duration(minutes: 1),
      );
      expect(
        mentionedDuration('Simmer for a minute'),
        const Duration(minutes: 1),
      );
      expect(
        mentionedDuration('Leave half an hour'),
        const Duration(minutes: 30),
      );
      expect(mentionedDuration('Fry ten minutes'), const Duration(minutes: 10));
    });

    test('takes the lower end of a range and the first mention', () {
      expect(
        mentionedDuration('Bake 10-15 minutes, then rest 5 minutes.'),
        const Duration(minutes: 10),
      );
      expect(
        mentionedDuration('Cook 3 to 4 minutes'),
        const Duration(minutes: 3),
      );
    });

    test('is null without a duration', () {
      expect(mentionedDuration('Preheat oven to 350° F.'), isNull);
      expect(mentionedDuration('Add 2 tablespoons of water.'), isNull);
    });
  });
}
