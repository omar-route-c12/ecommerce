import 'package:ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());
}
