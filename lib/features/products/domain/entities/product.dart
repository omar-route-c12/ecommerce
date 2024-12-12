import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final num price;
  final num? priceAfterDiscount;
  final num ratingsAverage;
  final int ratingsQuantity;
  final num sold;
  final int quantity;
  final List<String> imagesURLs;
  final String imageCoverURL;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.priceAfterDiscount,
    required this.sold,
    required this.quantity,
    required this.imagesURLs,
    required this.imageCoverURL,
    required this.ratingsAverage,
    required this.ratingsQuantity,
  });

  @override
  List<Object?> get props => [id];
}
