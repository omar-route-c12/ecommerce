import 'package:ecommerce/features/wishlist/data/mappers/product_mappers.dart';
import 'package:ecommerce/features/wishlist/data/models/user_wish_list_response_model.dart';
import 'package:ecommerce/features/wishlist/domain/entities/user_wishlist.dart';

extension UserWishlistMappers on UserWishListResponseModel {
  UserWishList get toEntity => UserWishList(
    status: status,
    count: count,
    products: products.map((e) => e.toEntity).toList(),
  );
}
