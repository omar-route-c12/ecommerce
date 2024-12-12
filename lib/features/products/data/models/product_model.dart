import 'package:ecommerce/core/models/category_model.dart';
import 'package:ecommerce/features/products/data/models/brand_model.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final num price;
  final num? priceAfterDiscount;
  final num ratingsAverage;
  final int ratingsQuantity;
  final num sold;
  final int quantity;
  final String imageCoverUrl;
  final List<String> imagesURLs;
  final String slug;
  final CategoryModel category;
  final BrandModel brand;
  final String createdAt;
  final String updatedAt;

  const ProductModel({
    required this.sold,
    required this.imagesURLs,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    this.priceAfterDiscount,
    required this.imageCoverUrl,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json['sold'] as num,
      imagesURLs: (json['images'] as List<dynamic>).cast<String>(),
      ratingsQuantity: json['ratingsQuantity'] as int,
      id: json['_id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as int,
      price: json['price'] as num,
      priceAfterDiscount: json['priceAfterDiscount'] as num?,
      imageCoverUrl: json['imageCover'] as String,
      category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      brand: BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: json['ratingsAverage'] as num,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
