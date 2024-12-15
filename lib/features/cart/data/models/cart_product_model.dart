import 'package:ecommerce/core/models/brand_model.dart';
import 'package:ecommerce/core/models/category_model.dart';

class CartProductModel {
  final String id;
  final String title;
  final String imageCoverURL;
  final double ratingsAverage;
  final CategoryModel category;
  final BrandModel brand;
  final int? quantity;

  const CartProductModel({
    required this.id,
    required this.title,
    required this.imageCoverURL,
    required this.ratingsAverage,
    required this.category,
    required this.brand,
    required this.quantity,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) =>
      CartProductModel(
        id: json['_id'] as String,
        title: json['title'] as String,
        imageCoverURL: json['imageCover'] as String,
        ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
        category:
            CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
        brand: BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
      );
}
