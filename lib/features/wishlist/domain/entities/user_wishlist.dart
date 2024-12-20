import 'package:ecommerce/features/products/domain/entities/product.dart';

class UserWishList {
  final String status;
  final num count;
  final List<Product> products;

  UserWishList({
    required this.status,
    required this.count,
    required this.products,
  });
}
