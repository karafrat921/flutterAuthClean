import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/core/usecases/usecase.dart';
import 'package:flutter_auth_clean/features/basket/domain/repositories/basket_repository.dart';
import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';
import 'package:equatable/equatable.dart';

class RemoveFromBasketUseCase
    implements UseCase<BasketItemEntity, RemoveFromBasketParams> {
  final BasketRepository repository;

  RemoveFromBasketUseCase(this.repository);

  @override
  Future<Either<Failure, BasketItemEntity>> call(
      RemoveFromBasketParams params) async {
    return await repository.removeFromBasket(params.itemId);
  }
}

class RemoveFromBasketParams extends Equatable {
  final String itemId;

  const RemoveFromBasketParams({required this.itemId});

  @override
  List<Object?> get props => [itemId];
}
