import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {}
