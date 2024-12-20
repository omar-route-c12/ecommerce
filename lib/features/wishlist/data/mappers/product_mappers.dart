import 'package:ecommerce/core/models/product_model.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';

extension ProductMapper on ProductModel {
  Product get toEntity => Product(
    id: id,
    title: title,
    description: description,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    sold: sold,
    quantity: quantity,
    imagesURLs: imagesURLs,
    imageCoverURL: imageCoverUrl,
    ratingsAverage: ratingsAverage,
    ratingsQuantity: ratingsQuantity,
  );
}