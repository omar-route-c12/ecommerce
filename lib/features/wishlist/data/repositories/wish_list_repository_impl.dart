import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exceptions.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/data/mappers/product_mapper.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/wishlist/data/data_sources/remote/wishlist_remote_data_source.dart';
import 'package:ecommerce/features/wishlist/data/mappers/add_or_remove_product_mappers.dart';
import 'package:ecommerce/features/wishlist/domain/entities/add_or_remove_product_to_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishListRepository)
class WishListRepositoryImpl implements WishListRepository {
  final WishListRemoteDataSource _remoteDataSource;

  WishListRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AddOrRemoveProductToWishList>> addProductToWishList(
      {required String productId}) async {
    try {
      final result =
          await _remoteDataSource.addProductToWishList(productId: productId);
      return Right(result.toEntity);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getUserWishList() async {
    try {
      final result = await _remoteDataSource.getUserWishList();
      return Right(result.products
          .map((productModel) => productModel.toEntity)
          .toList());
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, AddOrRemoveProductToWishList>>
      removeProductFromWishList({required String productId}) async {
    try {
      final result = await _remoteDataSource.removeProductFromWishList(
          productId: productId);
      return Right(result.toEntity);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
