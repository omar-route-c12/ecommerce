import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/cart_response_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;

  const CartApiRemoteDataSource(this._dio);

  @override
  Future<void> addToCart(String productId) async {
    try {
      await _dio
          .post(ApiConstants.cartEndPoint, data: {'productId': productId});
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to add product to cart');
    }
  }

  @override
  Future<CartResponseModel> getCart() async {
    try {
      final response = await _dio.get(ApiConstants.cartEndPoint);
      return CartResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to get cart');
    }
  }

  @override
  Future<CartResponseModel> updateCart(String productId, int quantity) async {
    try {
      final response = await _dio.put('${ApiConstants.cartEndPoint}/$productId',
          data: {'count': quantity});
      return CartResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        log(exception.toString());
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to update cart');
    }
  }

  @override
  Future<CartResponseModel> removeFromCart(String productId) async {
    try {
      final response =
          await _dio.delete('${ApiConstants.cartEndPoint}/$productId');
      return CartResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'failed to remove product from cart');
    }
  }
}
