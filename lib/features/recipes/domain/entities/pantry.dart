import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mise/features/recipes/domain/entities/ingredient_names.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

part 'pantry.freezed.dart';

/// An ingredient from TheMealDB's catalog, as offered when adding to the
/// pantry.
@freezed
abstract class CatalogIngredient with _$CatalogIngredient {
  const factory CatalogIngredient({
    required String name,

    /// Cut-out photo on a transparent background.
    required String imageUrl,
  }) = _CatalogIngredient;
}

/// A recipe found from what the user has at home.
@freezed
abstract class PantryMatch with _$PantryMatch {
  const factory PantryMatch({
    required RecipeSummary recipe,

    /// Pantry ingredients the recipe uses.
    required List<String> uses,

    /// Recipe ingredients the pantry lacks, staples aside; null while the
    /// full recipe is unknown.
    List<Ingredient>? missing,
  }) = _PantryMatch;

  const PantryMatch._();

  /// How ready the user is to cook it.
  PantryFit get fit => switch (missing?.length) {
    0 => PantryFit.ready,
    final int count when count <= PantryFit.almostMaxMissing =>
      PantryFit.almost,
    _ => PantryFit.idea,
  };
}

enum PantryFit {
  /// Nothing missing.
  ready,

  /// Up to [almostMaxMissing] ingredients missing.
  almost,

  /// More missing, or not known yet.
  idea;

  static const almostMaxMissing = 2;
}

/// Ingredients everyone is assumed to have, so they never count as
/// missing.
const pantryStaples = [
  'salt',
  'pepper',
  'black pepper',
  'water',
  'oil',
  'olive oil',
  'vegetable oil',
  'sunflower oil',
];

/// Recipes from [recipesByIngredient] (pantry ingredient -> recipes that
/// use it) ordered by how many pantry ingredients each uses, then by name.
List<PantryMatch> rankPantryMatches(
  Map<String, List<RecipeSummary>> recipesByIngredient,
) {
  final byId = <String, ({RecipeSummary recipe, List<String> uses})>{};
  recipesByIngredient.forEach((ingredient, found) {
    for (final recipe in found) {
      (byId[recipe.id] ??= (recipe: recipe, uses: [])).uses.add(ingredient);
    }
  });

  return [
    for (final entry in byId.values)
      PantryMatch(recipe: entry.recipe, uses: List.unmodifiable(entry.uses)),
  ]..sort((a, b) {
    final byUses = b.uses.length.compareTo(a.uses.length);
    return byUses != 0 ? byUses : a.recipe.name.compareTo(b.recipe.name);
  });
}

/// Ingredients of [recipe] that neither [pantry] nor the staples cover.
List<Ingredient> missingFromPantry(Recipe recipe, List<String> pantry) => [
  for (final ingredient in recipe.ingredients)
    if (![
      ...pantry,
      ...pantryStaples,
    ].any((have) => sameIngredient(have, ingredient.name)))
      ingredient,
];

/// Puts [matches] with a known [PantryMatch.missing] in order of [PantryFit],
/// then fewest missing, keeping the ranking within each.
List<PantryMatch> sortByFit(List<PantryMatch> matches) {
  final indexed = matches.indexed.toList()
    ..sort((a, b) {
      final byFit = a.$2.fit.index.compareTo(b.$2.fit.index);
      if (byFit != 0) return byFit;
      final byMissing = (a.$2.missing?.length ?? _unknown).compareTo(
        b.$2.missing?.length ?? _unknown,
      );
      return byMissing != 0 ? byMissing : a.$1.compareTo(b.$1);
    });
  return [for (final (_, match) in indexed) match];
}

/// Sorts unknown counts last.
const int _unknown = 1 << 20;

/// Catalog names for the same ingredient as [name]: TheMealDB lists "Egg"
/// and "Eggs" apart, and recipes use either. Always includes [name].
List<String> catalogVariants(String name, List<CatalogIngredient> catalog) {
  final stems = ingredientStems(name).join(' ');
  return {
    name,
    for (final ingredient in catalog)
      if (ingredientStems(ingredient.name).join(' ') == stems) ingredient.name,
  }.toList();
}

/// Catalog ingredients matching [query] for the add field: names starting
/// with it first, then names containing it, leaving out what [pantry]
/// already has.
List<CatalogIngredient> searchCatalog(
  List<CatalogIngredient> catalog,
  String query, {
  List<String> pantry = const [],
  int limit = 8,
}) {
  final needle = query.trim().toLowerCase();
  if (needle.isEmpty) return const [];
  final have = {for (final name in pantry) name.toLowerCase()};
  final candidates = [
    for (final ingredient in catalog)
      if (!have.contains(ingredient.name.toLowerCase()) &&
          ingredient.name.toLowerCase().contains(needle))
        ingredient,
  ];
  bool startsWith(CatalogIngredient ingredient) =>
      ingredient.name.toLowerCase().startsWith(needle);
  return [
    ...candidates.where(startsWith),
    ...candidates.where((ingredient) => !startsWith(ingredient)),
  ].take(limit).toList();
}

/// Common ingredients offered while the pantry is empty, as catalog names.
const pantrySuggestions = [
  'Chicken',
  'Eggs',
  'Rice',
  'Garlic',
  'Onions',
  'Tomatoes',
  'Potatoes',
  'Spaghetti',
  'Cheese',
  'Lemon',
];
