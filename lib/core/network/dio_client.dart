import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_auth_clean/core/constants/env.dart';
import 'package:flutter_auth_clean/core/network/api_interceptors.dart';
import 'package:flutter_auth_clean/core/network/api_request.dart';

@singleton
class DioClient {
  final Dio _dio;
  final ApiInterceptors _interceptors;

  Dio get dio => _dio;

  DioClient(this._interceptors) : _dio = Dio() {
    _dio
      ..options.baseUrl = Env.baseUrl
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.headers = {
        'Accept': 'application/json',
        'X-API-KEY': Env.apiKey,
      }
      ..interceptors.add(_interceptors);

    if (Env.debug) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> execute<T>(ApiRequest request) {
    switch (request.method.toUpperCase()) {
      case 'POST':
        return post<T>(
          request.path,
          data: request.data,
          options: Options(headers: request.headers),
        );
      case 'GET':
        return get<T>(
          request.path,
          queryParameters: request.queryParameters,
          options: Options(headers: request.headers),
        );
      case 'DELETE':
        return delete<T>(
          request.path,
          data: request.data,
          options: Options(headers: request.headers),
        );
      default:
        throw UnimplementedError(
            'HTTP method not supported: ${request.method}');
    }
  }
}
