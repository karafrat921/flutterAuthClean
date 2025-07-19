import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';
import 'package:flutter_auth_clean/features/basket/domain/repositories/basket_repository.dart';
import 'package:flutter_auth_clean/features/basket/data/datasources/basket_remote_data_source.dart';
import 'package:flutter_auth_clean/core/services/token_service.dart';
import 'package:flutter_auth_clean/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:flutter_auth_clean/core/network/token_retry_helper.dart';
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
    return withTokenRetry<BasketItemEntity>(
      tokenService: tokenService,
      refreshTokenUseCase: refreshTokenUseCase,
      action: (accessToken) async {
        final model = await remoteDataSource.addToBasket(item, accessToken);
        return BasketItemEntity.fromModel(model);
      },
    );
  }

  @override
  Future<Either<Failure, BasketItemEntity>> removeFromBasket(
      String itemId) async {
    return withTokenRetry<BasketItemEntity>(
      tokenService: tokenService,
      refreshTokenUseCase: refreshTokenUseCase,
      action: (accessToken) async {
        final model =
            await remoteDataSource.removeFromBasket(itemId, accessToken);
        return BasketItemEntity.fromModel(model);
      },
    );
  }
}
