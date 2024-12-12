import 'package:ecommerce/features/products/domain/use_cases/get_products_use_case.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProductsUseCase) : super(ProductsInitial());
  final GetProductsUseCase _getProductsUseCase;
  int productQuantity = 1;

  Future<void> getProducts({String? categoryId}) async {
    emit(GetProductsLoadingState());
    final result = await _getProductsUseCase.call(categoryId: categoryId);
    result.fold(
      (failure) => emit(GetProductsErrorState(message: failure.message)),
      (products) => emit(GetProductsSuccessState(products: products)),
    );
  }

  void changeProductQuantity(int updatedQuantity) {
    productQuantity = updatedQuantity;
    emit(ProductsQuantityChangedState());
  }
}
