import 'package:ecommerce/core/models/product_model.dart';

class UserWishListResponseModel {
  final String status;
  final num count;
  final List<ProductModel> products;

  UserWishListResponseModel({
    required this.status,
    required this.count,
    required this.products,
  });

  factory UserWishListResponseModel.fromJson(Map<String, dynamic> json) {
    return UserWishListResponseModel(
      status: json['status'] as String,
      count: json['count'] as num,
      products: (json['data'] as List<dynamic>)
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
