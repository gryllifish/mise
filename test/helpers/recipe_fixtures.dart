import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';

Recipe buildRecipe({required String id, String? name}) => Recipe(
  id: id,
  name: name ?? 'Recipe $id',
  category: 'Seafood',
  area: 'Japanese',
  imageUrl: 'https://example.com/$id.jpg',
  thumbnailUrl: 'https://example.com/$id.jpg/medium',
  ingredients: [
    for (final (name, measure) in [('Rice', '2 cups'), ('Salmon', '200g')])
      Ingredient(
        name: name,
        measure: measure,
        imageUrl: ingredientImageUrl(name),
      ),
  ],
  steps: const [
    'Cook the rice for 10 minutes.',
    'Slice the salmon.',
    'Serve.',
  ],
);

final Recipe sampleRecipe = buildRecipe(id: '1', name: 'Salmon bowl');

const sampleCategories = [
  RecipeCategory(name: 'Seafood', thumbnailUrl: 'https://example.com/s.png'),
  RecipeCategory(name: 'Dessert', thumbnailUrl: 'https://example.com/d.png'),
];

final List<RecipeSummary> sampleSummaries = [
  for (final id in ['1', '2', '3']) buildRecipe(id: id).summary,
];
