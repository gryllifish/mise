import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/features/recipes/controllers/pantry_controller.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';

import '../../../helpers/pump_app.dart';

void main() {
  late FakePantryRepository repository;

  setUp(() => repository = FakePantryRepository());

  ProviderContainer createContainer({List<String> pantry = const []}) {
    repository.pantry.addAll(pantry);
    return ProviderContainer.test(
      overrides: [
        pantryRepositoryProvider.overrideWithValue(repository),
        recipesRepositoryProvider.overrideWithValue(FakeRecipesRepository()),
      ],
      retry: (_, _) => null,
    )..listen(pantryMatchesControllerProvider, (_, _) {});
  }

  Future<List<String>> pantryOf(ProviderContainer container) =>
      container.read(pantryControllerProvider.future);

  group('PantryController', () {
    test('loads what is saved', () async {
      final container = createContainer(pantry: ['Rice']);

      expect(await pantryOf(container), ['Rice']);
    });

    test('adds, skipping what is already there', () async {
      final container = createContainer(pantry: ['Rice']);
      await pantryOf(container);
      final pantry = container.read(pantryControllerProvider.notifier);

      await pantry.add('Garlic');
      await pantry.add('rice');

      expect(await pantryOf(container), ['Rice', 'Garlic']);
      expect(repository.pantry, ['Rice', 'Garlic']);
    });

    test('removes, clears and restores', () async {
      final container = createContainer(pantry: ['Rice', 'Garlic']);
      await pantryOf(container);
      final pantry = container.read(pantryControllerProvider.notifier);

      await pantry.remove('Rice');
      expect(repository.pantry, ['Garlic']);

      await pantry.clear();
      expect(repository.pantry, isEmpty);

      await pantry.restore(['Rice', 'Garlic']);
      expect(await pantryOf(container), ['Rice', 'Garlic']);
    });

    test('rolls back and rethrows when saving fails', () async {
      final container = createContainer(pantry: ['Rice']);
      await pantryOf(container);
      repository.saveFailure = const StorageFailure();

      await expectLater(
        container.read(pantryControllerProvider.notifier).add('Garlic'),
        throwsA(isA<StorageFailure>()),
      );
      expect(await pantryOf(container), ['Rice']);
    });
  });

  group('PantryMatchesController', () {
    Future<List<PantryMatch>> matchesOf(ProviderContainer container) async {
      await container.read(ingredientCatalogControllerProvider.future);
      return container.read(pantryMatchesControllerProvider.future);
    }

    test('is empty for an empty pantry, without searching', () async {
      final container = createContainer();

      expect(await matchesOf(container), isEmpty);
      expect(repository.searches, isEmpty);
    });

    test('ranks by ingredients used and says what is missing', () async {
      // Every fake recipe needs rice and salmon.
      final container = createContainer(pantry: ['Rice', 'Garlic']);

      final matches = await matchesOf(container);

      expect(matches.map((match) => match.recipe.id), [
        'garlic-rice',
        'rice-bowl',
      ]);
      expect(matches.first.uses, ['Rice', 'Garlic']);
      expect(matches.first.missing?.map((i) => i.name), ['Salmon']);
      expect(matches.first.fit, PantryFit.almost);
    });

    test('a pantry with everything makes recipes ready', () async {
      final container = createContainer(pantry: ['Rice', 'Salmon']);

      final matches = await matchesOf(container);

      expect(matches.map((match) => match.fit), everyElement(PantryFit.ready));
    });

    test('searches every catalog variant of an ingredient', () async {
      final container = createContainer(pantry: ['Egg']);

      final matches = await matchesOf(container);

      expect(repository.searches, containsAll(['Egg', 'Eggs']));
      expect(
        matches.map((match) => match.recipe.name),
        containsAll(['Fried egg', 'Omelette']),
      );
    });

    test('retry searches again after a failure', () async {
      repository.searchFailure = const NoConnectionFailure();
      final container = createContainer(pantry: ['Rice']);
      await expectLater(matchesOf(container), throwsA(isA<Failure>()));

      repository.searchFailure = null;
      container.read(pantryMatchesControllerProvider.notifier).retry();

      expect(await matchesOf(container), hasLength(2));
    });
  });
}
