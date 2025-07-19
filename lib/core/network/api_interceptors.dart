import 'package:dio/dio.dart';
import 'package:flutter_auth_clean/core/services/token_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiInterceptors extends Interceptor {
  final TokenService tokenService;

  ApiInterceptors(this.tokenService);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await tokenService.getAccessToken();
    token.fold(
      (_) {},
      (accessToken) {
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
      },
    );
    print('[DIO][REQUEST] ${options.method} ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        '[DIO][RESPONSE] ${response.statusCode} ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      print('[DIO][ERROR] 401 Unauthorized - Otomatik logout sinyali!');
    }
    print('[DIO][ERROR] ${err.response?.statusCode} ${err.requestOptions.uri}');
    super.onError(err, handler);
  }
}
