import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';

class CartItemModel {
  final int count;
  final String id;
  final CartProductModel product;
  final int price;

  const CartItemModel({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      count: json['count'] as int,
      id: json['_id'] as String,
      product: CartProductModel.fromJson(json['product']),
      price: json['price'] as int,
    );
  }
}