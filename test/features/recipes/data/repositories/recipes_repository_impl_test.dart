import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/core/error/failure.dart';
import 'package:mise/core/error/result.dart';
import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/data/datasources/pantry_local_data_source.dart';
import 'package:mise/features/recipes/data/datasources/recipes_remote_data_source.dart';
import 'package:mise/features/recipes/data/datasources/saved_recipes_local_data_source.dart';
import 'package:mise/features/recipes/data/mappers/recipe_mapper.dart';
import 'package:mise/features/recipes/data/models/meal_dto.dart';
import 'package:mise/features/recipes/data/models/saved_recipe_dto.dart';
import 'package:mise/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:mise/features/recipes/domain/entities/pantry.dart';
import 'package:mise/features/recipes/domain/entities/recipe.dart';
import 'package:mise/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/fixtures.dart';
import '../../../../helpers/recipe_fixtures.dart';

class _MockRemote extends Mock implements RecipesRemoteDataSource {}

class _MockSaved extends Mock implements SavedRecipesLocalDataSource {}

class _MockPantryLocal extends Mock implements PantryLocalDataSource {}

void main() {
  late _MockRemote remote;
  late _MockSaved saved;

  final meal = MealDto.fromJson(
    (fixtureJson('meal_lookup')['meals'] as List<dynamic>).single
        as Map<String, dynamic>,
  );

  setUpAll(() {
    registerFallbackValue(sampleRecipe.toSavedDto(savedAt: DateTime(2026)));
    registerFallbackValue(<String>[]);
  });

  setUp(() {
    remote = _MockRemote();
    saved = _MockSaved();
  });

  group('RecipesRepositoryImpl', () {
    late RecipesRepositoryImpl repository;

    setUp(() => repository = RecipesRepositoryImpl(remote, saved));

    test('getCategories maps DTOs to entities', () async {
      when(remote.fetchCategories).thenAnswer(
        (_) async => const [
          CategoryDto(name: 'Beef', thumbnailUrl: 'https://example.com/b.png'),
        ],
      );

      expect(
        await repository.getCategories(),
        isA<Ok<List<RecipeCategory>>>().having(
          (ok) => ok.value.single.name,
          'name',
          'Beef',
        ),
      );
    });

    test('getRecipesInCategory turns exceptions into failures', () async {
      when(
        () => remote.fetchMealsInCategory('Beef'),
      ).thenThrow(const ServerException('boom', statusCode: 500));

      expect(
        await repository.getRecipesInCategory('Beef'),
        isA<Err<List<RecipeSummary>>>().having(
          (err) => err.failure,
          'failure',
          isA<ServerFailure>(),
        ),
      );
    });

    test('searchRecipes returns summaries and forwards the signal', () async {
      final cancel = CancelSignal();
      when(
        () => remote.searchMeals('teriyaki', cancel: cancel),
      ).thenAnswer((_) async => [meal]);

      expect(
        await repository.searchRecipes('teriyaki', cancel: cancel),
        isA<Ok<List<RecipeSummary>>>().having(
          (ok) => ok.value,
          'value',
          [meal.toEntity().summary],
        ),
      );
    });

    group('getRecipe', () {
      final savedCopy = sampleRecipe.toSavedDto(savedAt: DateTime(2026));

      Future<Result<RecipeLookup>> lookUpOffline(Object error) {
        when(() => remote.fetchMeal('1')).thenThrow(error);
        return repository.getRecipe('1');
      }

      test('returns the network recipe when online', () async {
        when(() => remote.fetchMeal('52772')).thenAnswer((_) async => meal);

        expect(
          await repository.getRecipe('52772'),
          isA<Ok<RecipeLookup>>().having(
            (ok) => ok.value,
            'value',
            (recipe: meal.toEntity(), isSavedCopy: false),
          ),
        );
        verifyNever(() => saved.read(any()));
      });

      test('falls back to the saved copy on a transient failure', () async {
        when(() => saved.read('1')).thenReturn(savedCopy);

        for (final error in const [
          NoConnectionException('offline'),
          RequestTimeoutException('slow'),
          ServerException('down', statusCode: 503),
        ]) {
          expect(
            await lookUpOffline(error),
            isA<Ok<RecipeLookup>>().having(
              (ok) => ok.value,
              'value',
              (recipe: sampleRecipe, isSavedCopy: true),
            ),
          );
        }
      });

      test('keeps the network failure when there is no saved copy', () async {
        when(() => saved.read('1')).thenReturn(null);

        expect(
          await lookUpOffline(const NoConnectionException('offline')),
          isA<Err<RecipeLookup>>().having(
            (err) => err.failure,
            'failure',
            isA<NoConnectionFailure>(),
          ),
        );
      });

      test('keeps the network failure when storage fails too', () async {
        when(
          () => saved.read('1'),
        ).thenThrow(const StorageException('closed'));

        expect(
          await lookUpOffline(const NoConnectionException('offline')),
          isA<Err<RecipeLookup>>().having(
            (err) => err.failure,
            'failure',
            isA<NoConnectionFailure>(),
          ),
        );
      });

      test('does not fall back on a non-transient failure', () async {
        expect(
          await lookUpOffline(const NotFoundException('gone')),
          isA<Err<RecipeLookup>>().having(
            (err) => err.failure,
            'failure',
            isA<NotFoundFailure>(),
          ),
        );
        verifyNever(() => saved.read(any()));
      });
    });

    test('getCuisines lists the known cuisines, most recipes first', () async {
      final result = await repository.getCuisines();

      expect(
        result,
        isA<Ok<List<Cuisine>>>()
            .having(
              (ok) => ok.value.first,
              'first',
              const Cuisine(
                name: 'British',
                flag: '🇬🇧',
              ),
            )
            .having((ok) => ok.value, 'all', hasLength(29)),
      );
      verifyZeroInteractions(remote);
    });

    test('getRecipesInCuisine maps summaries', () async {
      when(() => remote.fetchMealsInCuisine('Thai')).thenAnswer(
        (_) async => const [
          MealSummaryDto(
            id: '1',
            name: 'Pad Thai',
            thumbnailUrl: 'https://example.com/p.jpg',
          ),
        ],
      );

      expect(
        await repository.getRecipesInCuisine('Thai'),
        isA<Ok<List<RecipeSummary>>>().having(
          (ok) => ok.value.single.name,
          'name',
          'Pad Thai',
        ),
      );
    });

    test('getRandomRecipe maps the meal', () async {
      when(remote.fetchRandomMeal).thenAnswer((_) async => meal);

      expect(
        await repository.getRandomRecipe(),
        isA<Ok<Recipe>>().having((ok) => ok.value, 'value', meal.toEntity()),
      );
    });
  });

  group('SavedRecipesRepositoryImpl', () {
    final now = DateTime(2026, 10, 28, 12);
    late SavedRecipesRepositoryImpl repository;

    setUp(() => repository = SavedRecipesRepositoryImpl(saved, () => now));

    test('getSavedRecipes lists the most recently saved first', () async {
      final older = buildRecipe(id: '1');
      final newer = buildRecipe(id: '2');
      when(saved.readAll).thenReturn([
        older.toSavedDto(savedAt: DateTime(2026)),
        newer.toSavedDto(savedAt: DateTime(2026, 6)),
      ]);

      expect(
        await repository.getSavedRecipes(),
        isA<Ok<List<Recipe>>>().having((ok) => ok.value, 'value', [
          newer,
          older,
        ]),
      );
    });

    test('getSavedRecipes reports corrupted data as a failure', () async {
      when(saved.readAll).thenThrow(const ParsingException('corrupted'));

      expect(
        await repository.getSavedRecipes(),
        isA<Err<List<Recipe>>>().having(
          (err) => err.failure,
          'failure',
          isA<ParsingFailure>(),
        ),
      );
    });

    test('saveRecipe stamps the current time', () async {
      when(() => saved.write(any())).thenAnswer((_) async {});

      expect(await repository.saveRecipe(sampleRecipe), isA<Ok<void>>());
      final written =
          verify(() => saved.write(captureAny())).captured.single
              as SavedRecipeDto;
      expect(written, sampleRecipe.toSavedDto(savedAt: now));
    });

    test('removeRecipe reports storage problems as a failure', () async {
      when(
        () => saved.delete('1'),
      ).thenThrow(const StorageException('closed'));

      expect(
        await repository.removeRecipe('1'),
        isA<Err<void>>().having(
          (err) => err.failure,
          'failure',
          isA<StorageFailure>(),
        ),
      );
    });
  });

  group('PantryRepositoryImpl', () {
    late _MockPantryLocal local;
    late PantryRepositoryImpl repository;

    setUp(() {
      local = _MockPantryLocal();
      repository = PantryRepositoryImpl(remote, local);
    });

    test('getCatalog gives each ingredient its photo', () async {
      when(remote.fetchIngredientCatalog).thenAnswer(
        (_) async => const [CatalogIngredientDto(name: ' Garlic ')],
      );

      expect(
        await repository.getCatalog(),
        isA<Ok<List<CatalogIngredient>>>().having(
          (ok) => ok.value.single,
          'ingredient',
          CatalogIngredient(
            name: 'Garlic',
            imageUrl: ingredientImageUrl('Garlic'),
          ),
        ),
      );
    });

    test('getRecipesWithIngredient turns exceptions into failures', () async {
      when(
        () => remote.fetchMealsWithIngredient('Rice'),
      ).thenThrow(const NoConnectionException('offline'));

      expect(
        await repository.getRecipesWithIngredient('Rice'),
        isA<Err<List<RecipeSummary>>>().having(
          (err) => err.failure,
          'failure',
          isA<NoConnectionFailure>(),
        ),
      );
    });

    test('reads and saves the pantry', () async {
      when(local.read).thenReturn(['Rice']);
      when(() => local.write(any())).thenAnswer((_) async {});

      expect(
        await repository.getPantry(),
        isA<Ok<List<String>>>().having((ok) => ok.value, 'value', ['Rice']),
      );
      expect(await repository.savePantry(['Rice', 'Egg']), isA<Ok<void>>());
      verify(() => local.write(['Rice', 'Egg'])).called(1);
    });

    test('storage problems become a StorageFailure', () async {
      when(
        () => local.write(any()),
      ).thenThrow(const StorageException('closed'));

      expect(
        await repository.savePantry(['Rice']),
        isA<Err<void>>().having(
          (err) => err.failure,
          'failure',
          isA<StorageFailure>(),
        ),
      );
    });
  });
}
