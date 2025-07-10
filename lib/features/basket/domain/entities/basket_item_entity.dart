import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_auth_clean/features/basket/data/models/basket_item_model.dart';

part 'basket_item_entity.freezed.dart';
part 'basket_item_entity.g.dart';

@freezed
class BasketItemEntity with _$BasketItemEntity {
  const factory BasketItemEntity({
    required String id,
    required String name,
    required int quantity,
  }) = _BasketItemEntity;

  factory BasketItemEntity.fromJson(Map<String, dynamic> json) =>
      _$BasketItemEntityFromJson(json);

  factory BasketItemEntity.fromModel(BasketItemModel model) => BasketItemEntity(
        id: model.id,
        name: model.name,
        quantity: model.quantity,
      );
}
