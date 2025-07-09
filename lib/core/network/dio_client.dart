import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_auth_clean/core/constants/env.dart';
import 'package:flutter_auth_clean/core/network/api_interceptors.dart';

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
}
