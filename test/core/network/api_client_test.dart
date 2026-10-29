import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mise/core/error/app_exception.dart';
import 'package:mise/core/network/api_client.dart';

DioException _error(DioExceptionType type, {int? status}) {
  final options = RequestOptions(path: '/x');
  return DioException(
    requestOptions: options,
    type: type,
    response: status == null
        ? null
        : Response<void>(requestOptions: options, statusCode: status),
  );
}

void main() {
  test('timeouts become RequestTimeoutException', () {
    for (final type in [
      DioExceptionType.connectionTimeout,
      DioExceptionType.sendTimeout,
      DioExceptionType.receiveTimeout,
    ]) {
      expect(mapDioException(_error(type)), isA<RequestTimeoutException>());
    }
  });

  test('connection errors become NoConnectionException', () {
    expect(
      mapDioException(_error(DioExceptionType.connectionError)),
      isA<NoConnectionException>(),
    );
  });

  test('bad responses keep their status code', () {
    expect(
      mapDioException(_error(DioExceptionType.badResponse, status: 503)),
      isA<ServerException>().having((e) => e.statusCode, 'status', 503),
    );
  });
}
