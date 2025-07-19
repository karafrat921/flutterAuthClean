import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_auth_clean/features/auth/data/models/auth_model.dart';

part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@freezed
class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);

  factory AuthEntity.fromModel(AuthModel model) => AuthEntity(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        expiresAt: model.expiresAt,
      );
}
