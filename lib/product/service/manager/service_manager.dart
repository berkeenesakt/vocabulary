import 'package:dio/dio.dart';
import 'package:vocabulary/product/cache/hive_manager.dart';
import 'package:vocabulary/product/init/config/app_environment.dart';

class ServiceManager {
  late final Dio _dio;

  ServiceManager() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '${AppEnvironmentItems.baseUrl.value}/api/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
      ),
    );

    _dio.interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = HiveManager.instance.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    ]);
  }

  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<T?> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<T?> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  Future<T?> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data as T;
    } on DioException catch (e) {
      _handleError(e);
      return null;
    }
  }

  void _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw Exception('Connection timed out');
      case DioExceptionType.badResponse:
        throw Exception('Bad response: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        throw Exception('Request cancelled');
      // ignore: no_default_cases
      default:
        throw Exception('Unknown error occurred');
    }
  }
}
