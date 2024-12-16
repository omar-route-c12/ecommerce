import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final List<CartItemModel> items;
  final int totalCartPrice;
  final String? id;
  final String? cartOwnerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CartModel({
    required this.id,
    required this.cartOwnerId,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json['products'] as List<dynamic>)
          .map((item) => CartItemModel.fromJson(item))
          .toList(),
      totalCartPrice: json['totalCartPrice'] as int,
      id: json['_id'] as String?,
      cartOwnerId: json['cartOwner'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );
  }
}
