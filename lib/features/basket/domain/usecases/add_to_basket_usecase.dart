import 'package:dartz/dartz.dart';
import 'package:flutter_auth_clean/core/errors/failures.dart';
import 'package:flutter_auth_clean/core/usecases/usecase.dart';
import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';
import 'package:flutter_auth_clean/features/basket/domain/repositories/basket_repository.dart';
import 'package:equatable/equatable.dart';

class AddToBasketUseCase
    implements UseCase<BasketItemEntity, AddToBasketParams> {
  final BasketRepository repository;

  AddToBasketUseCase(this.repository);

  @override
  Future<Either<Failure, BasketItemEntity>> call(
      AddToBasketParams params) async {
    return await repository.addToBasket(params.item);
  }
}

class AddToBasketParams extends Equatable {
  final BasketItemEntity item;

  const AddToBasketParams({required this.item});

  @override
  List<Object?> get props => [item];
}
