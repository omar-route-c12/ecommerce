import 'package:ecommerce/features/wishlist/data/models/add_or_remove_product_to_wishlist_response_model.dart';

import 'package:ecommerce/features/wishlist/domain/entities/add_or_remove_product_to_wishlist.dart';

extension AddOrRemoveProductMappers
    on AddOrRemoveProductToWishListResponseModel {
  AddOrRemoveProductToWishList get toEntity => AddOrRemoveProductToWishList(
      status: status, message: message, data: data);
}
