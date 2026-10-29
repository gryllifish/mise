import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/core/utils/app_logger.dart';

/// Builds the HTTP client for the recipe API.
///
/// Short timeouts keep the UI honest: a slow network becomes a
/// [RequestTimeoutException] with a retry button instead of a spinner that
/// never ends.
Dio createApiClient({required String baseUrl}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 12),
    ),
  );
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: false,
        responseHeader: false,
        logPrint: (line) => AppLogger.debug(line.toString()),
      ),
    );
  }
  return dio;
}

/// Converts a [DioException] into the [AppException] the data layer throws.
AppException mapDioException(DioException error) => switch (error.type) {
  DioExceptionType.connectionTimeout ||
  DioExceptionType.sendTimeout ||
  DioExceptionType.receiveTimeout => RequestTimeoutException(
    'Request timed out: ${error.requestOptions.uri}',
    cause: error,
  ),
  DioExceptionType.badResponse => ServerException(
    'Server error ${error.response?.statusCode}: ${error.requestOptions.uri}',
    statusCode: error.response?.statusCode,
    cause: error,
  ),
  DioExceptionType.connectionError => NoConnectionException(
    'No connection: ${error.requestOptions.uri}',
    cause: error,
  ),
  // Certificate problems, cancellations and anything else unexpected.
  _ => ServerException(
    'Request failed: ${error.requestOptions.uri}',
    cause: error,
  ),
};
