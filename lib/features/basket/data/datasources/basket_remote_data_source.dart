import 'package:flutter_auth_clean/features/basket/data/models/basket_item_model.dart';
import 'package:flutter_auth_clean/features/basket/data/requests/add_to_basket_request.dart';
import 'package:flutter_auth_clean/features/basket/data/requests/remove_from_basket_request.dart';
import 'package:flutter_auth_clean/core/network/dio_client.dart';
import 'package:flutter_auth_clean/features/basket/domain/entities/basket_item_entity.dart';
import 'package:injectable/injectable.dart';

abstract class BasketRemoteDataSource {
  Future<BasketItemModel> addToBasket(
      BasketItemEntity item, String accessToken);
  Future<BasketItemModel> removeFromBasket(String itemId, String accessToken);
}

@LazySingleton(as: BasketRemoteDataSource)
class BasketRemoteDataSourceImpl implements BasketRemoteDataSource {
  final DioClient dioClient;

  BasketRemoteDataSourceImpl(this.dioClient);

  @override
  Future<BasketItemModel> addToBasket(
      BasketItemEntity item, String accessToken) async {
    final request = AddToBasketRequest(item: item, accessToken: accessToken);
    final response = await dioClient.execute(request);
    return BasketItemModel.fromJson(response.data);
  }

  @override
  Future<BasketItemModel> removeFromBasket(
      String itemId, String accessToken) async {
    final request =
        RemoveFromBasketRequest(itemId: itemId, accessToken: accessToken);
    final response = await dioClient.execute(request);
    return BasketItemModel.fromJson(response.data);
  }
}
