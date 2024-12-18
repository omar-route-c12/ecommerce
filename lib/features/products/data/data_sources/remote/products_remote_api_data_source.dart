
import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce/features/products/data/models/products_response_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsRemoteApiDataSource implements ProductsRemoteDataSource {
  final Dio _dio;

  ProductsRemoteApiDataSource(this._dio);

  @override
  Future<ProductResponseModel> getProducts({String? categoryId}) async {
    try {
      final response = await _dio.get(
        ApiConstants.productsEndPoint,
        queryParameters: categoryId == null
            ? null
            : {
                'category': categoryId,
              },
      );
      return ProductResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get products');
    }
  }
}
