import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<CartItemData> items;
  final int totalPrice;

  const Cart({
    required this.items,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [items];
}
