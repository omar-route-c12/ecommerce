import 'package:ecommerce/features/home/data/models/categories_response/category_model.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';

extension CategoryMapper on CategoryModel {
  Category get toEntity => Category(
        id: id,
        name: name,
        imageURL: imageURL,
      );
}
