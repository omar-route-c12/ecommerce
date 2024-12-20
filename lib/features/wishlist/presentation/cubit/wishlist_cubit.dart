import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/add_product_to_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/get_user_wishlist.dart';
import 'package:ecommerce/features/wishlist/domain/use_cases/remove_product_from_wishlist.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WishListCubit extends Cubit<WishListStates> {
  WishListCubit(this._addProductToWishlist, this._removeProductFromWishlist, this._getUserWishlist)
      : super(WishListInitial());

  final AddProductToWishlist _addProductToWishlist;
  final RemoveProductFromWishlist _removeProductFromWishlist;
  final GetUserWishlist _getUserWishlist;

  List<Product> products = [];

  Future<void> addProductToWishList({required String productId}) async {
    emit(AddProductToWishListLoadingState());
    final result = await _addProductToWishlist(productId);
    result.fold(
          (failure) => emit(AddProductToWishListErrorState(message: failure.message)),
          (_) async {
        emit(AddProductToWishListSuccessState());
        await getUserWishlist(); // Refresh wishlist after addition
      },
    );
  }

  Future<void> removeProductFromWishList({required String productId}) async {
    emit(RemoveProductFromWishListLoadingState());
    final result = await _removeProductFromWishlist(productId);
    result.fold(
          (failure) => emit(RemoveProductFromWishListErrorState(message: failure.message)),
          (_) async {
        emit(RemoveProductFromWishListSuccessState());
        await getUserWishlist(); // Refresh wishlist after removal
      },
    );
  }

  Future<void> getUserWishlist() async {
    emit(GetUserWishListLoadingState());
    final result = await _getUserWishlist();
    result.fold(
          (failure) => emit(GetUserWishListErrorState(message: failure.message)),
          (newProducts) {
        products = newProducts;
        emit(GetUserWishListSuccessState());
      },
    );
  }
}
