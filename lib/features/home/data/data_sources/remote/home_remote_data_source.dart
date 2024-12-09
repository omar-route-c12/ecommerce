import 'package:ecommerce/features/home/data/models/categories_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesResponseModel> getCategories();
}
