import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';
import 'package:flutter_auth_clean/features/basket/domain/repositories/basket_repository.dart';
import 'package:flutter_auth_clean/features/basket/data/datasources/basket_remote_data_source.dart';
import 'package:flutter_auth_clean/core/services/token_service.dart';
import 'package:flutter_auth_clean/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BasketRepository)
class BasketRepositoryImpl implements BasketRepository {
  final BasketRemoteDataSource remoteDataSource;
  final TokenService tokenService;
  final RefreshTokenUseCase refreshTokenUseCase;

  BasketRepositoryImpl(
      this.remoteDataSource, this.tokenService, this.refreshTokenUseCase);

  @override
  Future<Either<Failure, BasketItemEntity>> addToBasket(
      BasketItemEntity item) async {
    return _withTokenRetry<BasketItemEntity>(
      (accessToken) async {
        final model = await remoteDataSource.addToBasket(item, accessToken);
        return model.toEntity();
      },
    );
  }

  @override
  Future<Either<Failure, BasketItemEntity>> removeFromBasket(
      String itemId) async {
    return _withTokenRetry<BasketItemEntity>(
      (accessToken) async {
        final model =
            await remoteDataSource.removeFromBasket(itemId, accessToken);
        return model.toEntity();
      },
    );
  }

  Future<Either<Failure, T>> _withTokenRetry<T>(
      Future<T> Function(String accessToken) action) async {
    final accessTokenResult = await tokenService.getAccessToken();
    return await accessTokenResult.fold(
      (failure) => Left(failure),
      (accessToken) async {
        if (accessToken == null) {
          return Left(CacheFailure(message: 'No access token'));
        }
        try {
          final result = await action(accessToken);
          return Right(result);
        } on DioException catch (e) {
          if (e.response?.statusCode == 401) {
            // Token expired, try refresh
            final refreshTokenResult = await tokenService.getRefreshToken();
            return await refreshTokenResult.fold(
              (failure) => Left(failure),
              (refreshToken) async {
                if (refreshToken == null) {
                  return Left(CacheFailure(message: 'No refresh token'));
                }
                final refreshResult = await refreshTokenUseCase(
                    RefreshTokenParams(refreshToken: refreshToken));
                return await refreshResult.fold(
                  (failure) => Left(failure),
                  (_) async {
                    // Try again with new token
                    final newTokenResult = await tokenService.getAccessToken();
                    return await newTokenResult.fold(
                      (failure) => Left(failure),
                      (newToken) async {
                        if (newToken == null) {
                          return Left(CacheFailure(
                              message: 'No access token after refresh'));
                        }
                        try {
                          final retryResult = await action(newToken);
                          return Right(retryResult);
                        } catch (e) {
                          return Left(CacheFailure(
                              message: 'Failed after token refresh'));
                        }
                      },
                    );
                  },
                );
              },
            );
          }
          return Left(CacheFailure(message: 'Network error'));
        } catch (e) {
          return Left(CacheFailure(message: 'Unknown error'));
        }
      },
    );
  }
}
