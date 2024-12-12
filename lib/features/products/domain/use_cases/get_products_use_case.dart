import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetProductsUseCase {
  final ProductsRepository _productsRepository;

  GetProductsUseCase(this._productsRepository);

  Future<Either<Failure, List<Product>>> call({String? categoryId}) async =>
      await _productsRepository.getProducts(categoryId: categoryId);
}
