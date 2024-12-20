import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/features/wishlist/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/models/add_or_remove_product_to_wishlist_response_model.dart';
import 'package:ecommerce/features/wishlist/data/models/user_wish_list_response_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishListRemoteDataSource)
class WishListApiRemoteDataSource implements WishListRemoteDataSource {
  final Dio _dio;

  WishListApiRemoteDataSource(this._dio);

  @override
  Future<AddOrRemoveProductToWishListResponseModel> addProductToWishList(
      {required String productId}) async {
    try {
      final response = await _dio
          .post(ApiConstants.wishListEndPoint, data: {'productId': productId});
      return AddOrRemoveProductToWishListResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to add product to WishList');
    }
  }

  @override
  Future<AddOrRemoveProductToWishListResponseModel> removeProductFromWishList(
      {required String productId}) async {
    try {
      final response =
          await _dio.delete('${ApiConstants.wishListEndPoint}/$productId');
      return AddOrRemoveProductToWishListResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(
          message ?? 'Failed to remove product from WishList');
    }
  }

  @override
  Future<UserWishListResponseModel> getUserWishList()async {
    try {
      final response = await _dio
          .get(ApiConstants.wishListEndPoint);
      return UserWishListResponseModel.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get product user WishList');
    }
  }
}
