import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';

class BasketItemModel {
  final String id;
  final String name;
  final int quantity;

  BasketItemModel({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory BasketItemModel.fromJson(Map<String, dynamic> json) {
    return BasketItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
    );
  }

  BasketItemEntity toEntity() => BasketItemEntity(
        id: id,
        name: name,
        quantity: quantity,
      );
}
