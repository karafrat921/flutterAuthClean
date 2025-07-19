// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketItemEntityImpl _$$BasketItemEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BasketItemEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$BasketItemEntityImplToJson(
        _$BasketItemEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
    };
