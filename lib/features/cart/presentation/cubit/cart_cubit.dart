import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/delete_from_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/update_cart.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._addToCart,
    this._getCart,
    this._deleteFromCart,
    this._updateCart,
  ) : super(CartInitialState());
  final AddToCart _addToCart;
  final GetCart _getCart;
  final DeleteFromCart _deleteFromCart;
  final UpdateCart _updateCart;
  late Cart cart;

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoadingState());
    final result = await _addToCart(productId);
    result.fold(
      (failure) => emit(AddToCartErrorState(failure.message)),
      (_) => emit(AddToCartSuccessState()),
    );
  }

  Future<void> getCart() async {
    emit(GetCartLoadingState());
    final result = await _getCart();
    result.fold(
      (failure) => emit(GetCartErrorState(failure.message)),
      (userCart) {
        cart = userCart;
        emit(GetCartSuccessState());
      },
    );
  }

  Future<void> updateCart(String productId, int quantity) async {
    emit(UpdateCartLoadingState());
    final result = await _updateCart(productId, quantity);
    result.fold(
      (failure) => emit(UpdateCartErrorState(failure.message)),
      (updatedCart) {
        cart = updatedCart;
        emit(UpdateCartSuccessState());
      },
    );
  }

  Future<void> deleteFromCart(String productId) async {
    emit(DeleteFromCartLoadingState());
    final result = await _deleteFromCart(productId);
    result.fold(
      (failure) => emit(DeleteFromCartErrorState(failure.message)),
      (updatedCart) {
        cart = updatedCart;
        emit(DeleteFromCartSuccessState());
      },
    );
  }
}
