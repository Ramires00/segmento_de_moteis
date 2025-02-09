import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

final _cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(hours: 1),
    priority: CachePriority.normal);

class HttpClient {
  HttpClient({
    required this.dio,
    required this.baseUrl,
  });

  final Dio dio;
  final String baseUrl;

  Dio _createHttpClient({
    Map<String, dynamic>? queryParameters,
  }) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      queryParameters: queryParameters,
    );

    dio.interceptors.add(
      DioCacheInterceptor(options: _cacheOptions),
    );

    return dio;
  }

  Future<dynamic> get({String? path}) async {
    final httpClient = _createHttpClient();

    final response = await httpClient.get(path ?? '');

    return response.data;
  }
}
