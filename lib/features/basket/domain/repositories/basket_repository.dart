import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';

abstract class BasketRepository {
  Future<Either<Failure, BasketItemEntity>> addToBasket(BasketItemEntity item);
  Future<Either<Failure, BasketItemEntity>> removeFromBasket(String itemId);
}
