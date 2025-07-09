import 'package:flutter_auth_clean/features/auth/domain/entities/auth_entity.dart';

class AuthModel {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  AuthModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
    );
  }

  AuthEntity toEntity() => AuthEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiresAt: expiresAt,
      );
}
