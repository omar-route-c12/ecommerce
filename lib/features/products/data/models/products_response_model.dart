import 'package:ecommerce/core/models/meta_data_model.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';

class ProductResponseModel {
  final int results;
  final MetadataModel metadata;
  final List<ProductModel> products;

  const ProductResponseModel({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      results: json['results'] as int,
      metadata:
          MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      products: (json['data'] as List<dynamic>)
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
