import 'package:ecommerce/features/cart/data/models/cart_response_model.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(String productId);

  Future<CartResponseModel> getCart();

  Future<CartResponseModel> updateCart(String productId, int quantity);

  Future<CartResponseModel> removeFromCart(String productId);
}
