import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/data/datasources/recipes_remote_data_source.dart';

import '../../../../helpers/fixtures.dart';

typedef _Responder =
    Future<ResponseBody> Function(
      RequestOptions options,
      Future<void>? cancelFuture,
    );

/// Answers requests in memory instead of hitting TheMealDB.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this._respond);

  final _Responder _respond;
  final requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    requests.add(options);
    return _respond(options, cancelFuture);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(String body, {int status = 200}) => ResponseBody.fromString(
  body,
  status,
  headers: {
    Headers.contentTypeHeader: [Headers.jsonContentType],
  },
);

void main() {
  late _FakeAdapter adapter;
  late RecipesRemoteDataSource dataSource;

  void respond(_Responder responder) {
    adapter = _FakeAdapter(responder);
    dataSource = RecipesRemoteDataSource(
      Dio(BaseOptions(baseUrl: 'https://example.test/api/'))
        ..httpClientAdapter = adapter,
    );
  }

  void respondWith(String body, {int status = 200}) =>
      respond((_, _) async => _json(body, status: status));

  void failWith(DioExceptionType type) => respond(
    (options, _) async =>
        throw DioException(requestOptions: options, type: type),
  );

  group('successful responses', () {
    test('fetchCategories parses the category list', () async {
      respondWith(fixture('categories'));

      final categories = await dataSource.fetchCategories();

      expect(categories.map((c) => c.name), ['Beef', 'Chicken', 'Dessert']);
      expect(adapter.requests.single.path, 'categories.php');
    });

    test('fetchMealsInCategory sends the category as a query', () async {
      respondWith(fixture('category_meals'));

      final meals = await dataSource.fetchMealsInCategory('Seafood');

      expect(meals.map((m) => m.id), ['53483', '53495', '53147']);
      expect(adapter.requests.single.queryParameters, {'c': 'Seafood'});
    });

    test('fetchMeal returns the looked-up meal', () async {
      respondWith(fixture('meal_lookup'));

      final meal = await dataSource.fetchMeal('52772');

      expect(meal.name, 'Teriyaki Chicken Casserole');
      expect(adapter.requests.single.queryParameters, {'i': '52772'});
    });

    test('fetchRandomMeal returns the single meal', () async {
      respondWith(fixture('meal_lookup'));

      expect((await dataSource.fetchRandomMeal()).id, '52772');
    });

    test('fetchMealsInCuisine sends the cuisine as a query', () async {
      respondWith(fixture('category_meals'));

      final meals = await dataSource.fetchMealsInCuisine('Spanish');

      expect(meals, hasLength(3));
      expect(adapter.requests.single.queryParameters, {'a': 'Spanish'});
    });

    test('fetchIngredientCatalog parses the catalog', () async {
      respondWith(fixture('ingredient_list'));

      final catalog = await dataSource.fetchIngredientCatalog();

      expect(catalog.map((i) => i.name), [
        'Chicken',
        'Salmon',
        'Beef',
        'Pork',
        'Avocado',
      ]);
      expect(adapter.requests.single.queryParameters, {'i': 'list'});
    });

    test('fetchMealsWithIngredient writes spaces as underscores', () async {
      respondWith(fixture('category_meals'));

      final meals = await dataSource.fetchMealsWithIngredient('Chicken Breast');

      expect(meals, hasLength(3));
      expect(adapter.requests.single.queryParameters, {'i': 'Chicken_Breast'});
    });

    test('searchMeals treats a null meal list as no results', () async {
      respondWith('{"meals": null}');

      expect(await dataSource.searchMeals('zzz'), isEmpty);
      expect(adapter.requests.single.queryParameters, {'s': 'zzz'});
    });
  });

  group('failures', () {
    test('a lookup with no meal throws NotFoundException', () async {
      respondWith('{"meals": null}');

      await expectLater(
        dataSource.fetchMeal('1'),
        throwsA(isA<NotFoundException>()),
      );
    });

    test('malformed JSON throws ParsingException', () async {
      respondWith('{"meals": [{"idMeal": 5}]}');

      await expectLater(
        dataSource.fetchMealsInCategory('Beef'),
        throwsA(isA<ParsingException>()),
      );
    });

    test('an error status throws ServerException with the code', () async {
      respondWith('', status: 503);

      await expectLater(
        dataSource.fetchCategories(),
        throwsA(
          isA<ServerException>().having((e) => e.statusCode, 'status', 503),
        ),
      );
    });

    test('connection errors throw NoConnectionException', () async {
      failWith(DioExceptionType.connectionError);

      await expectLater(
        dataSource.fetchCategories(),
        throwsA(isA<NoConnectionException>()),
      );
    });

    test('timeouts throw RequestTimeoutException', () async {
      failWith(DioExceptionType.receiveTimeout);

      await expectLater(
        dataSource.fetchRandomMeal(),
        throwsA(isA<RequestTimeoutException>()),
      );
    });
  });

  test('cancelling the signal aborts an in-flight search', () async {
    final sent = Completer<void>();
    final aborted = Completer<void>();
    respond((options, cancelFuture) async {
      sent.complete();
      await cancelFuture;
      aborted.complete();
      return _json(fixture('meal_lookup'));
    });
    final cancel = CancelSignal();

    final search = dataSource.searchMeals('salmon', cancel: cancel);
    await sent.future;
    cancel.cancel();

    await expectLater(search, throwsA(isA<AppException>()));
    await expectLater(aborted.future, completes);
  });
}
