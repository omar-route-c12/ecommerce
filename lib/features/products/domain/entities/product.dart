import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final int price;
  final String imageCoverURL;
  final List<String> imagesURLs;
  final double ratingsAverage;
  final int ratingsQuantity;
  final int sold;
  final int? priceAfterDiscount;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCoverURL,
    required this.imagesURLs,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.sold,
    required this.priceAfterDiscount,
  });

  @override
  List<Object?> get props => [id];
}
