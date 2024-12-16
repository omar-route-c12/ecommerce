abstract class CartState {}

class CartInitialState extends CartState {}

class AddToCartLoadingState extends CartState {}

class AddToCartSuccessState extends CartState {}

class AddToCartErrorState extends CartState {
  final String message;

  AddToCartErrorState(this.message);
}

class GetCartLoadingState extends CartState {}

class GetCartSuccessState extends CartState {}

class GetCartErrorState extends CartState {
  final String message;

  GetCartErrorState(this.message);
}

class UpdateCartLoadingState extends CartState {}

class UpdateCartSuccessState extends CartState {}

class UpdateCartErrorState extends CartState {
  final String message;

  UpdateCartErrorState(this.message);
}

class DeleteFromCartLoadingState extends CartState {}

class DeleteFromCartSuccessState extends CartState {}

class DeleteFromCartErrorState extends CartState {
  final String message;

  DeleteFromCartErrorState(this.message);
}
