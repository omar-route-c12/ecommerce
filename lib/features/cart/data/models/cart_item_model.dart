import 'package:ecommerce/features/cart/data/models/cart_product_model.dart';

class CartItemModel {
  final String id;
  final CartProductModel product;
  final int count;
  final int price;

  const CartItemModel({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json['_id'] as String,
        product:
            CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
        count: json['count'] as int,
        price: json['price'] as int,
      );
}
