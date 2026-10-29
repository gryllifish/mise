import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/error/result.dart';
import 'package:mise/features/recipes/controllers/recipe_controller.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/recipe_fixtures.dart';

class _MockRecipesRepository extends Mock implements RecipesRepository {}

void main() {
  late _MockRecipesRepository repository;

  setUp(() => repository = _MockRecipesRepository());

  ProviderContainer createContainer() => ProviderContainer.test(
    overrides: [recipesRepositoryProvider.overrideWithValue(repository)],
    // Riverpod retries failed providers by default; tests want the raw error.
    retry: (_, _) => null,
  );

  group('RecipeController', () {
    test('exposes the lookup, including whether it is a saved copy', () async {
      final lookup = (recipe: sampleRecipe, isSavedCopy: true);
      when(() => repository.getRecipe('1')).thenAnswer((_) async => Ok(lookup));
      final container = createContainer();

      expect(
        await container.read(recipeControllerProvider('1').future),
        lookup,
      );
    });

    test('surfaces failures as AsyncError', () async {
      when(
        () => repository.getRecipe('1'),
      ).thenAnswer((_) async => const Err(NotFoundFailure()));
      final container = createContainer();

      await expectLater(
        container.read(recipeControllerProvider('1').future),
        throwsA(isA<NotFoundFailure>()),
      );
    });

    test('retry looks the recipe up again', () async {
      when(() => repository.getRecipe('1')).thenAnswer(
        (_) async => Ok((recipe: sampleRecipe, isSavedCopy: false)),
      );
      final container = createContainer()
        ..listen(recipeControllerProvider('1'), (_, _) {});
      await container.read(recipeControllerProvider('1').future);

      container.read(recipeControllerProvider('1').notifier).retry();
      await container.read(recipeControllerProvider('1').future);

      verify(() => repository.getRecipe('1')).called(2);
    });
  });
}
