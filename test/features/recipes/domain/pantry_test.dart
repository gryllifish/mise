import 'package:flutter_test/flutter_test.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/domain/entities/ingredient_names.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

import '../../../helpers/recipe_fixtures.dart';

RecipeSummary _recipe(String id, [String? name]) =>
    buildRecipe(id: id, name: name).summary;

Recipe _withIngredients(List<String> names) => buildRecipe(id: 'x').copyWith(
  ingredients: [
    for (final name in names)
      Ingredient(name: name, measure: '1', imageUrl: ingredientImageUrl(name)),
  ],
);

List<CatalogIngredient> _catalog(List<String> names) => [
  for (final name in names)
    CatalogIngredient(name: name, imageUrl: ingredientImageUrl(name)),
];

void main() {
  group('sameIngredient', () {
    test('matches a kind of the same ingredient both ways', () {
      expect(sameIngredient('garlic', 'Minced Garlic'), isTrue);
      expect(sameIngredient('Chicken Breasts', 'chicken'), isTrue);
      expect(sameIngredient('Tomatoes', 'tomato'), isTrue);
    });

    test('keeps different ingredients apart', () {
      expect(sameIngredient('garlic', 'ginger'), isFalse);
      expect(sameIngredient('brown sugar', 'brown rice'), isFalse);
    });
  });

  group('rankPantryMatches', () {
    test('ranks by how many pantry ingredients each recipe uses', () {
      final ranked = rankPantryMatches({
        'Rice': [_recipe('1', 'B dish'), _recipe('2', 'A dish')],
        'Garlic': [_recipe('2', 'A dish'), _recipe('3', 'C dish')],
      });

      expect(ranked.map((match) => match.recipe.id), ['2', '1', '3']);
      expect(ranked.first.uses, ['Rice', 'Garlic']);
      expect(ranked.first.missing, isNull, reason: 'not looked up yet');
    });

    test('breaks ties by name', () {
      final ranked = rankPantryMatches({
        'Rice': [_recipe('1', 'Zesty rice'), _recipe('2', 'Arroz')],
      });

      expect(ranked.map((match) => match.recipe.name), ['Arroz', 'Zesty rice']);
    });
  });

  group('missingFromPantry', () {
    test('leaves out what the pantry covers and the staples', () {
      final recipe = _withIngredients([
        'Minced garlic',
        'Rice',
        'Salt',
        'Olive Oil',
        'Lemon',
      ]);

      expect(
        missingFromPantry(recipe, ['garlic', 'Rice']).map((i) => i.name),
        ['Lemon'],
      );
    });

    test('is empty when everything is at hand', () {
      final recipe = _withIngredients(['Eggs', 'Water', 'Black pepper']);

      expect(missingFromPantry(recipe, ['Egg']), isEmpty);
    });
  });

  test('fit and sortByFit put ready recipes first', () {
    PantryMatch match(String id, int? missing) => PantryMatch(
      recipe: _recipe(id),
      uses: const ['Rice'],
      missing: missing == null
          ? null
          : _withIngredients(List.filled(missing, 'Lemon')).ingredients,
    );

    final sorted = sortByFit([
      match('unknown', null),
      match('three', 3),
      match('two', 2),
      match('ready', 0),
      match('one', 1),
    ]);

    expect(sorted.map((match) => match.recipe.id), [
      'ready',
      'one',
      'two',
      'three',
      'unknown',
    ]);
    expect(sorted.map((match) => match.fit), [
      PantryFit.ready,
      PantryFit.almost,
      PantryFit.almost,
      PantryFit.idea,
      PantryFit.idea,
    ]);
  });

  test('catalogVariants finds singular and plural entries', () {
    final catalog = _catalog(['Egg', 'Eggs', 'Eggplant', 'Rice']);

    expect(catalogVariants('Egg', catalog), ['Egg', 'Eggs']);
    expect(catalogVariants('Basil', catalog), ['Basil']);
  });

  group('searchCatalog', () {
    final catalog = _catalog(['Garlic', 'Garlic Clove', 'Wild Garlic', 'Rice']);

    test('puts names starting with the query first', () {
      expect(searchCatalog(catalog, 'gar').map((i) => i.name), [
        'Garlic',
        'Garlic Clove',
        'Wild Garlic',
      ]);
    });

    test('skips what the pantry has, and blank queries', () {
      expect(
        searchCatalog(catalog, 'garlic', pantry: ['garlic']).map((i) => i.name),
        ['Garlic Clove', 'Wild Garlic'],
      );
      expect(searchCatalog(catalog, '  '), isEmpty);
    });

    test('caps the number of suggestions', () {
      expect(searchCatalog(catalog, 'i', limit: 2), hasLength(2));
    });
  });
}
