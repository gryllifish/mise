import 'package:dio/dio.dart';
import 'package:mise/core/config/env.dart';
import 'package:mise/core/network/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client_provider.g.dart';

/// The shared HTTP client. Override it in tests to fake responses.
@Riverpod(keepAlive: true)
Dio apiClient(Ref ref) {
  final dio = createApiClient(baseUrl: Env.apiBaseUrl);
  ref.onDispose(dio.close);
  return dio;
}
