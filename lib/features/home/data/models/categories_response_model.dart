import 'package:ecommerce/core/models/category_model.dart';
import 'package:ecommerce/core/models/meta_data_model.dart';

class CategoriesResponseModel {
  final int results;
  final MetadataModel metadata;
  final List<CategoryModel> categories;

  CategoriesResponseModel({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      results: json['results'] as int,
      metadata: MetadataModel.fromJson(json['metadata']),
      categories: (json['data'] as List<dynamic>)
          .map((item) => CategoryModel.fromJson(item))
          .toList(),
    );
  }
}