import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserWishlist {
  final WishListRepository wishListRepository;

  GetUserWishlist(this.wishListRepository);

  Future<Either<Failure, List<Product>>> call() async {
    return await wishListRepository.getUserWishList();
  }
}
