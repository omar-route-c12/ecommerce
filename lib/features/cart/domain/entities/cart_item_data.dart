import 'package:ecommerce/features/cart/domain/entities/cart_product.dart';
import 'package:equatable/equatable.dart';

class CartItemData extends Equatable {
  final CartProduct product;
  final int count;
  final int price;

  const CartItemData({
    required this.product,
    required this.count,
    required this.price,
  });

  @override
  List<Object?> get props => [product];
}
