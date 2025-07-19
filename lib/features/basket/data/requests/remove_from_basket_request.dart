import 'package:flutter_auth_clean/core/network/api_request.dart';

class RemoveFromBasketRequest implements ApiRequest {
  final String itemId;
  final String accessToken;

  RemoveFromBasketRequest({required this.itemId, required this.accessToken});

  @override
  String get path => '/basket/remove';

  @override
  String get method => 'POST';

  @override
  Map<String, dynamic> get data => {
        'id': itemId,
      };

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  Map<String, dynamic>? get headers => {
        'Authorization': 'Bearer $accessToken',
      };
}
