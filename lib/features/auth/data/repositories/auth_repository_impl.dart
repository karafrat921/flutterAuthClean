import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_auth_clean/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_auth_clean/core/services/token_service.dart';
import 'package:flutter_auth_clean/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final TokenService tokenService;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.tokenService, this.remoteDataSource);

  @override
  Future<Either<Failure, AuthEntity>> login(
      String email, String password) async {
    try {
      final model = await remoteDataSource.login(email, password);
      final entity = AuthEntity.fromModel(model);
      await tokenService.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure(message: 'Login failed'));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> refreshToken(String refreshToken) async {
    try {
      final model = await remoteDataSource.refreshToken(refreshToken);
      final entity = AuthEntity.fromModel(model);
      await tokenService.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );
      return Right(entity);
    } catch (e) {
      return Left(CacheFailure(message: 'Refresh token failed'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return await tokenService.deleteTokens();
    } catch (e) {
      return Left(CacheFailure(message: 'Logout failed'));
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    final accessTokenResult = await tokenService.getAccessToken();
    return accessTokenResult.fold(
      (failure) => Right(false),
      (token) => Right(token != null),
    );
  }
}
