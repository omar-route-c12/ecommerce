import 'package:ecommerce/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final List<CartItemModel> items;
  final int totalPrice;
  final String? id;
  final String? cartOwnerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const CartModel({
    required this.items,
    required this.totalPrice,
    required this.id,
    required this.cartOwnerId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        items: (json['products'] as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPrice: json['totalCartPrice'] as int,
        id: json['_id'] as String?,
        cartOwnerId: json['cartOwner'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );
}
