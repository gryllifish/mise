import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/error/result.dart';
import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/controllers/discover_controller.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
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

  void stubCategories(Result<List<RecipeCategory>> result) =>
      when(repository.getCategories).thenAnswer((_) async => result);

  void stubSearch(Future<Result<List<RecipeSummary>>> Function() answer) =>
      when(
        () => repository.searchRecipes(any(), cancel: any(named: 'cancel')),
      ).thenAnswer((_) => answer());

  group('CategoriesController', () {
    test('exposes the repository categories', () async {
      stubCategories(const Ok(sampleCategories));
      final container = createContainer();

      expect(
        await container.read(categoriesControllerProvider.future),
        sampleCategories,
      );
    });

    test('surfaces failures as AsyncError', () async {
      stubCategories(const Err(NoConnectionFailure()));
      final container = createContainer();

      await expectLater(
        container.read(categoriesControllerProvider.future),
        throwsA(isA<NoConnectionFailure>()),
      );
    });

    test('retry reloads from the repository', () async {
      stubCategories(const Ok(sampleCategories));
      final container = createContainer()
        ..listen(categoriesControllerProvider, (_, _) {});
      await container.read(categoriesControllerProvider.future);

      container.read(categoriesControllerProvider.notifier).retry();
      await container.read(categoriesControllerProvider.future);

      verify(repository.getCategories).called(2);
    });
  });

  group('activeCategory', () {
    test('defaults to the first category until one is picked', () async {
      stubCategories(const Ok(sampleCategories));
      final container = createContainer()
        ..listen(activeCategoryProvider, (_, _) {});
      await container.read(categoriesControllerProvider.future);

      expect(container.read(activeCategoryProvider).value, 'Seafood');

      container
          .read(selectedCategoryControllerProvider.notifier)
          .select('Dessert');

      expect(container.read(activeCategoryProvider).value, 'Dessert');
    });

    test('carries the categories failure', () async {
      stubCategories(const Err(TimeoutFailure()));
      final container = createContainer()
        ..listen(activeCategoryProvider, (_, _) {});
      await container
          .read(categoriesControllerProvider.future)
          .catchError((_) => const <RecipeCategory>[]);

      expect(
        container.read(activeCategoryProvider).error,
        isA<TimeoutFailure>(),
      );
    });
  });

  group('cuisines', () {
    test('browse mode starts on categories and can switch', () {
      final container = createContainer();

      expect(
        container.read(browseModeControllerProvider),
        BrowseMode.categories,
      );
      container
          .read(browseModeControllerProvider.notifier)
          .select(BrowseMode.cuisines);
      expect(container.read(browseModeControllerProvider), BrowseMode.cuisines);
    });

    test('activeCuisine defaults to the first until one is picked', () async {
      when(repository.getCuisines).thenAnswer(
        (_) async => const Ok([
          Cuisine(name: 'British', flag: '🇬🇧'),
          Cuisine(name: 'Thai', flag: '🇹🇭'),
        ]),
      );
      final container = createContainer()
        ..listen(activeCuisineProvider, (_, _) {});
      await container.read(cuisinesControllerProvider.future);

      expect(container.read(activeCuisineProvider).value, 'British');

      container.read(selectedCuisineControllerProvider.notifier).select('Thai');
      expect(container.read(activeCuisineProvider).value, 'Thai');
    });

    test('cuisineRecipes loads the recipes of its cuisine', () async {
      when(
        () => repository.getRecipesInCuisine('Thai'),
      ).thenAnswer((_) async => Ok(sampleSummaries));
      final container = createContainer();

      expect(
        await container.read(cuisineRecipesProvider('Thai').future),
        sampleSummaries,
      );
    });
  });

  test('categoryRecipes loads the recipes of its category', () async {
    when(
      () => repository.getRecipesInCategory('Dessert'),
    ).thenAnswer((_) async => Ok(sampleSummaries));
    final container = createContainer();

    expect(
      await container.read(categoryRecipesProvider('Dessert').future),
      sampleSummaries,
    );
  });

  group('TodaysPickController', () {
    test('picks one recipe per session', () async {
      when(
        repository.getRandomRecipe,
      ).thenAnswer((_) async => Ok(sampleRecipe));
      final container = createContainer();

      expect(
        await container.read(todaysPickControllerProvider.future),
        sampleRecipe,
      );
      await container.read(todaysPickControllerProvider.future);

      verify(repository.getRandomRecipe).called(1);
    });

    test('retry picks again', () async {
      when(
        repository.getRandomRecipe,
      ).thenAnswer((_) async => const Err(ServerFailure(statusCode: 500)));
      final container = createContainer();
      await expectLater(
        container.read(todaysPickControllerProvider.future),
        throwsA(isA<ServerFailure>()),
      );

      container.read(todaysPickControllerProvider.notifier).retry();
      await container
          .read(todaysPickControllerProvider.future)
          .catchError((_) => sampleRecipe);

      verify(repository.getRandomRecipe).called(2);
    });
  });

  group('searchResults', () {
    test('is null for a blank query and never searches', () async {
      final container = createContainer();
      container.read(searchQueryControllerProvider.notifier).search('   ');

      expect(await container.read(searchResultsProvider.future), isNull);
      verifyNever(
        () => repository.searchRecipes(any(), cancel: any(named: 'cancel')),
      );
    });

    test('searches the trimmed query once typing pauses', () {
      fakeAsync((async) {
        stubSearch(() async => Ok(sampleSummaries));
        final container = createContainer();
        final results = container.listen(searchResultsProvider, (_, _) {});

        container
            .read(searchQueryControllerProvider.notifier)
            .search(' salmon ');
        async.elapse(searchDebounce - const Duration(milliseconds: 1));
        verifyNever(
          () => repository.searchRecipes(any(), cancel: any(named: 'cancel')),
        );

        async.elapse(const Duration(milliseconds: 1));
        verify(
          () => repository.searchRecipes(
            'salmon',
            cancel: any(named: 'cancel'),
          ),
        ).called(1);
        expect(results.read().value, sampleSummaries);
      });
    });

    test('only the last query typed within the debounce is sent', () {
      fakeAsync((async) {
        stubSearch(() async => Ok(sampleSummaries));
        final container = createContainer()
          ..listen(searchResultsProvider, (_, _) {});
        final query = container.read(searchQueryControllerProvider.notifier)
          ..search('sal');
        async.elapse(const Duration(milliseconds: 200));
        query.search('salmon');
        async.elapse(searchDebounce);

        final queries = verify(
          () => repository.searchRecipes(
            captureAny(),
            cancel: any(named: 'cancel'),
          ),
        ).captured;
        expect(queries, ['salmon']);
      });
    });

    test('a newer query cancels the in-flight request', () {
      fakeAsync((async) {
        final pending = Completer<Result<List<RecipeSummary>>>();
        stubSearch(() => pending.future);
        final container = createContainer()
          ..listen(searchResultsProvider, (_, _) {});
        final query = container.read(searchQueryControllerProvider.notifier)
          ..search('salmon');
        async.elapse(searchDebounce);
        final cancel =
            verify(
                  () => repository.searchRecipes(
                    'salmon',
                    cancel: captureAny(named: 'cancel'),
                  ),
                ).captured.single
                as CancelSignal;
        expect(cancel.isCancelled, isFalse);

        query.search('salmon teriyaki');
        async.flushMicrotasks();

        expect(cancel.isCancelled, isTrue);
      });
    });

    test('clearing the query cancels and returns to null', () {
      fakeAsync((async) {
        final pending = Completer<Result<List<RecipeSummary>>>();
        stubSearch(() => pending.future);
        final container = createContainer();
        final results = container.listen(searchResultsProvider, (_, _) {});
        final query = container.read(searchQueryControllerProvider.notifier)
          ..search('salmon');
        async.elapse(searchDebounce);
        final cancel =
            verify(
                  () => repository.searchRecipes(
                    'salmon',
                    cancel: captureAny(named: 'cancel'),
                  ),
                ).captured.single
                as CancelSignal;

        query.clear();
        async.elapse(Duration.zero);

        expect(cancel.isCancelled, isTrue);
        expect(results.read(), const AsyncData<List<RecipeSummary>?>(null));
      });
    });

    test('surfaces search failures as AsyncError', () {
      fakeAsync((async) {
        stubSearch(() async => const Err(NoConnectionFailure()));
        final container = createContainer();
        final results = container.listen(searchResultsProvider, (_, _) {});

        container.read(searchQueryControllerProvider.notifier).search('x');
        async.elapse(searchDebounce);

        expect(results.read().error, isA<NoConnectionFailure>());
      });
    });
  });
}
