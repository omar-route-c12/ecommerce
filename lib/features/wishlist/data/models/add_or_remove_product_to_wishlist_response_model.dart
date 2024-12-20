class AddOrRemoveProductToWishListResponseModel {
  final String status;
  final String message;
  final List<String> data;

  AddOrRemoveProductToWishListResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddOrRemoveProductToWishListResponseModel.fromJson(Map<String, dynamic> json) {
    return AddOrRemoveProductToWishListResponseModel(
      status: json['status'] as String,
      message: json['message'] as String,
      data: List<String>.from(json['data']),
    );
  }
}
