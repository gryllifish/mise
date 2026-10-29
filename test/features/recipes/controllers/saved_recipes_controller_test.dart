import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/error/result.dart';
import 'package:mise/features/recipes/controllers/saved_recipes_controller.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/recipe_fixtures.dart';

class _MockSavedRecipesRepository extends Mock
    implements SavedRecipesRepository {}

void main() {
  late _MockSavedRecipesRepository repository;

  final other = buildRecipe(id: '2');

  setUp(() => repository = _MockSavedRecipesRepository());

  Future<ProviderContainer> createContainer(List<Recipe> saved) async {
    when(repository.getSavedRecipes).thenAnswer((_) async => Ok(saved));
    final container = ProviderContainer.test(
      overrides: [savedRecipesRepositoryProvider.overrideWithValue(repository)],
      // Riverpod retries failed providers by default; tests want the raw error.
      retry: (_, _) => null,
    );
    await container.read(savedRecipesControllerProvider.future);
    return container;
  }

  List<Recipe>? savedIn(ProviderContainer container) =>
      container.read(savedRecipesControllerProvider).value;

  test('loads the saved recipes', () async {
    final container = await createContainer([sampleRecipe, other]);

    expect(savedIn(container), [sampleRecipe, other]);
    expect(container.read(isRecipeSavedProvider('2')), isTrue);
    expect(container.read(isRecipeSavedProvider('3')), isFalse);
  });

  test('surfaces load failures as AsyncError', () async {
    when(
      repository.getSavedRecipes,
    ).thenAnswer((_) async => const Err(StorageFailure()));
    final container = ProviderContainer.test(
      overrides: [savedRecipesRepositoryProvider.overrideWithValue(repository)],
      retry: (_, _) => null,
    );

    await expectLater(
      container.read(savedRecipesControllerProvider.future),
      throwsA(isA<StorageFailure>()),
    );
  });

  group('toggle', () {
    test('saves optimistically, before the write finishes', () async {
      final write = Completer<Result<void>>();
      when(
        () => repository.saveRecipe(sampleRecipe),
      ).thenAnswer((_) => write.future);
      final container = await createContainer([other]);

      final toggling = container
          .read(savedRecipesControllerProvider.notifier)
          .toggle(sampleRecipe);

      expect(savedIn(container), [sampleRecipe, other]);
      expect(container.read(isRecipeSavedProvider('1')), isTrue);

      write.complete(const Ok<void>(null));
      await toggling;

      expect(savedIn(container), [sampleRecipe, other]);
    });

    test('removes a recipe that is already saved', () async {
      when(
        () => repository.removeRecipe('1'),
      ).thenAnswer((_) async => const Ok<void>(null));
      final container = await createContainer([sampleRecipe, other]);

      await container
          .read(savedRecipesControllerProvider.notifier)
          .toggle(sampleRecipe);

      expect(savedIn(container), [other]);
      verifyNever(() => repository.saveRecipe(sampleRecipe));
    });

    test('rolls back and rethrows when saving fails', () async {
      when(
        () => repository.saveRecipe(sampleRecipe),
      ).thenAnswer((_) async => const Err(StorageFailure()));
      final container = await createContainer([other]);

      await expectLater(
        container
            .read(savedRecipesControllerProvider.notifier)
            .toggle(sampleRecipe),
        throwsA(isA<StorageFailure>()),
      );

      expect(savedIn(container), [other]);
    });

    test('rolls back and rethrows when removing fails', () async {
      when(
        () => repository.removeRecipe('1'),
      ).thenAnswer((_) async => const Err(StorageFailure()));
      final container = await createContainer([sampleRecipe]);

      await expectLater(
        container
            .read(savedRecipesControllerProvider.notifier)
            .toggle(sampleRecipe),
        throwsA(isA<StorageFailure>()),
      );

      expect(savedIn(container), [sampleRecipe]);
    });
  });
}
