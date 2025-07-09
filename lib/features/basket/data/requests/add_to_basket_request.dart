import 'package:flutter_auth_clean/core/network/api_request.dart';
import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';

class AddToBasketRequest implements ApiRequest {
  final BasketItemEntity item;
  final String accessToken;

  AddToBasketRequest({required this.item, required this.accessToken});

  @override
  String get path => '/basket/add';

  @override
  String get method => 'POST';

  @override
  Map<String, dynamic> get data => {
        'id': item.id,
        'name': item.name,
        'quantity': item.quantity,
      };

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  Map<String, dynamic>? get headers => {
        'Authorization': 'Bearer $accessToken',
      };
}
