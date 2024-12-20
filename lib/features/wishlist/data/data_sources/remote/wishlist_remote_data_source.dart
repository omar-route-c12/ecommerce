import 'package:ecommerce/features/wishlist/data/models/add_or_remove_product_to_wishlist_response_model.dart';
import 'package:ecommerce/features/wishlist/data/models/user_wish_list_response_model.dart';

abstract class WishListRemoteDataSource {
  Future<AddOrRemoveProductToWishListResponseModel> addProductToWishList(
      {required String productId});

  Future<AddOrRemoveProductToWishListResponseModel> removeProductFromWishList(
      {required String productId});

  Future<UserWishListResponseModel> getUserWishList();
}
