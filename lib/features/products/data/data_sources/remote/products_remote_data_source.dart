import 'package:ecommerce/features/products/data/models/products_response_model.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductResponseModel> getProducts({String? categoryId});
}