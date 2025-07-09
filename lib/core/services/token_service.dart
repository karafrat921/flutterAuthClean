import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';

@singleton
class TokenService {
  final FlutterSecureStorage _secureStorage;
  static const _accessTokenKey = 'ACCESS_TOKEN';
  static const _refreshTokenKey = 'REFRESH_TOKEN';

  TokenService(this._secureStorage);

  Future<Either<Failure, void>> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await _secureStorage.write(key: _accessTokenKey, value: accessToken);
      await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to save tokens'));
    }
  }

  Future<Either<Failure, String?>> getAccessToken() async {
    try {
      return Right(await _secureStorage.read(key: _accessTokenKey));
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to get access token'));
    }
  }

  Future<Either<Failure, String?>> getRefreshToken() async {
    try {
      return Right(await _secureStorage.read(key: _refreshTokenKey));
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to get refresh token'));
    }
  }

  Future<Either<Failure, void>> deleteTokens() async {
    try {
      await _secureStorage.delete(key: _accessTokenKey);
      await _secureStorage.delete(key: _refreshTokenKey);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to delete tokens'));
    }
  }
}
