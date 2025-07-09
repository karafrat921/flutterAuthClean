import 'package:flutter_auth_clean/core/network/dio_client.dart';
import 'package:flutter_auth_clean/features/auth/data/models/auth_model.dart';
import 'package:flutter_auth_clean/features/auth/data/requests/login_request.dart';
import 'package:flutter_auth_clean/features/auth/data/requests/refresh_token_request.dart';
import 'package:flutter_auth_clean/features/auth/data/requests/logout_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> refreshToken(String refreshToken);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<AuthModel> login(String email, String password) async {
    final response = await dioClient.execute(
      LoginRequest(email: email, password: password),
    );
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<AuthModel> refreshToken(String refreshToken) async {
    final response = await dioClient.execute(
      RefreshTokenRequest(refreshToken),
    );
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<void> logout() async {
    await dioClient.execute(LogoutRequest());
  }
}
