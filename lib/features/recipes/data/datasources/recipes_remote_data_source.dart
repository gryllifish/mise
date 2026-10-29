import 'package:dio/dio.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/core/network/api_client.dart';
import 'package:mise/core/utils/cancel_signal.dart';
import 'package:mise/features/recipes/data/models/meal_dto.dart';
import 'package:mise/shared/providers/api_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_remote_data_source.g.dart';

/// Talks to TheMealDB.
///
/// Every method throws [NoConnectionException], [RequestTimeoutException],
/// [ServerException] or [ParsingException]; lookups may also throw
/// [NotFoundException].
class RecipesRemoteDataSource {
  const RecipesRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<CategoryDto>> fetchCategories() async {
    final json = await _get('categories.php');
    return _parse(
      () => _list(json, 'categories').map(CategoryDto.fromJson).toList(),
    );
  }

  Future<List<MealSummaryDto>> fetchMealsInCategory(String category) async {
    final json = await _get('filter.php', query: {'c': category});
    return _parse(
      () => _list(json, 'meals').map(MealSummaryDto.fromJson).toList(),
    );
  }

  Future<List<MealSummaryDto>> fetchMealsInCuisine(String cuisine) async {
    final json = await _get('filter.php', query: {'a': cuisine});
    return _parse(
      () => _list(json, 'meals').map(MealSummaryDto.fromJson).toList(),
    );
  }

  Future<List<MealDto>> searchMeals(
    String query, {
    CancelSignal? cancel,
  }) async {
    final json = await _get('search.php', query: {'s': query}, cancel: cancel);
    return _parse(() => _list(json, 'meals').map(MealDto.fromJson).toList());
  }

  Future<MealDto> fetchMeal(String id) async {
    final json = await _get('lookup.php', query: {'i': id});
    final meal = _parse(() => _list(json, 'meals').firstOrNull);
    if (meal == null) throw NotFoundException('No meal with id $id');
    return _parse(() => MealDto.fromJson(meal));
  }

  Future<List<CatalogIngredientDto>> fetchIngredientCatalog() async {
    final json = await _get('list.php', query: {'i': 'list'});
    return _parse(
      () => _list(json, 'meals').map(CatalogIngredientDto.fromJson).toList(),
    );
  }

  /// The free API filters by one ingredient at a time; names use
  /// underscores for spaces ("chicken_breast").
  Future<List<MealSummaryDto>> fetchMealsWithIngredient(
    String ingredient,
  ) async {
    final json = await _get(
      'filter.php',
      query: {'i': ingredient.trim().replaceAll(' ', '_')},
    );
    return _parse(
      () => _list(json, 'meals').map(MealSummaryDto.fromJson).toList(),
    );
  }

  Future<MealDto> fetchRandomMeal() async {
    final json = await _get('random.php');
    return _parse(() => MealDto.fromJson(_list(json, 'meals').first));
  }

  Future<Map<String, dynamic>> _get(
    String path, {
    Map<String, String>? query,
    CancelSignal? cancel,
  }) async {
    final token = CancelToken();
    if (cancel != null) {
      // Not awaited: only fires if the signal is cancelled mid-request.
      cancel.whenCancelled.then((_) => token.cancel()).ignore();
    }
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: query,
        cancelToken: token,
      );
      return response.data ?? const {};
    } on DioException catch (error) {
      throw mapDioException(error);
    }
  }

  /// TheMealDB answers "no results" with `null` instead of an empty list.
  List<Map<String, dynamic>> _list(Map<String, dynamic> json, String key) =>
      (json[key] as List<dynamic>? ?? const []).cast<Map<String, dynamic>>();

  T _parse<T>(T Function() parse) {
    try {
      return parse();
    } on Object catch (error) {
      // Malformed JSON surfaces as TypeError or FormatException.
      throw ParsingException('Unexpected recipe JSON', cause: error);
    }
  }
}

@riverpod
RecipesRemoteDataSource recipesRemoteDataSource(Ref ref) =>
    RecipesRemoteDataSource(ref.watch(apiClientProvider));
