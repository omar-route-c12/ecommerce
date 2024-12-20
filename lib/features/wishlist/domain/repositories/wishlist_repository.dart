import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/wishlist/domain/entities/add_or_remove_product_to_wishlist.dart';

abstract class WishListRepository {
  Future<Either<Failure, AddOrRemoveProductToWishList>> addProductToWishList(
      {required String productId});

  Future<Either<Failure, AddOrRemoveProductToWishList>>
      removeProductFromWishList({required String productId});

  Future<Either<Failure, List<Product>>> getUserWishList();
}
