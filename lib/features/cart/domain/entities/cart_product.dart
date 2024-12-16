import 'package:equatable/equatable.dart';

class CartProduct extends Equatable {
  final String id;
  final String title;
  final String imageCoverURL;
  final double ratingsAverage;

  const CartProduct({
    required this.id,
    required this.title,
    required this.imageCoverURL,
    required this.ratingsAverage,
  });

  @override
  List<Object?> get props => [id];
}
