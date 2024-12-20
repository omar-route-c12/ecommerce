import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/wishlist/domain/entities/add_or_remove_product_to_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProductToWishlist {
  final WishListRepository wishListRepository;

  AddProductToWishlist(this.wishListRepository);

  Future<Either<Failure, AddOrRemoveProductToWishList>> call(
      String productId) async {
    return await wishListRepository.addProductToWishList(productId: productId);
  }
}
