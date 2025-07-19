import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_item_model.freezed.dart';
part 'basket_item_model.g.dart';

@freezed
class BasketItemModel with _$BasketItemModel {
  const factory BasketItemModel({
    required String id,
    required String name,
    required int quantity,
  }) = _BasketItemModel;

  factory BasketItemModel.fromJson(Map<String, dynamic> json) =>
      _$BasketItemModelFromJson(json);
}
