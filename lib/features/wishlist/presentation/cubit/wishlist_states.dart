abstract class WishListStates {}

class WishListInitial extends WishListStates {}

class AddProductToWishListLoadingState extends WishListStates {}

class AddProductToWishListSuccessState extends WishListStates {}

class AddProductToWishListErrorState extends WishListStates {
  final String message;

  AddProductToWishListErrorState({required this.message});
}

class RemoveProductFromWishListLoadingState extends WishListStates {}

class RemoveProductFromWishListSuccessState extends WishListStates {}

class RemoveProductFromWishListErrorState extends WishListStates {
  final String message;

  RemoveProductFromWishListErrorState({required this.message});
}

class GetUserWishListLoadingState extends WishListStates {}

class GetUserWishListSuccessState extends WishListStates {}

class GetUserWishListErrorState extends WishListStates {
  final String message;

  GetUserWishListErrorState({required this.message});
}
