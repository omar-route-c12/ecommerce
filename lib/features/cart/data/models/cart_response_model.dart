import 'package:ecommerce/features/cart/data/models/cart_model.dart';

class CartResponseModel {
  final String status;
  final int numOfCartItems;
  final String? cartId;
  final CartModel cart;

  const CartResponseModel({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.cart,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
      status: json['status'] as String,
      numOfCartItems: json['numOfCartItems'] as int,
      cartId: json['cartId'] as String?,
      cart: CartModel.fromJson(json['data']),
    );
  }
}
