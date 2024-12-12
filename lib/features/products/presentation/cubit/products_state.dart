import 'package:ecommerce/features/products/domain/entities/product.dart';

class ProductsState {}

class ProductsInitial extends ProductsState {}

class GetProductsLoadingState extends ProductsState {}

class GetProductsErrorState extends ProductsState {
  final String message;

  GetProductsErrorState({required this.message});
}

class GetProductsSuccessState extends ProductsState {
  final List<Product> products;

  GetProductsSuccessState({required this.products});
}

class ProductsQuantityChangedState extends ProductsState {}
