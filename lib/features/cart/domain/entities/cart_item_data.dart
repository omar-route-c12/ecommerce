import 'package:ecommerce/features/cart/domain/entities/cart_product.dart';

class CartItemData {
  final int count;
  final CartProduct product;
  final int price;

  const CartItemData({
    required this.count,
    required this.product,
    required this.price,
  });
}
