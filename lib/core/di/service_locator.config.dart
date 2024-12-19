// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/core/di/register_module.dart' as _i709;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_sources.dart'
    as _i74;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i258;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i407;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i385;
import 'package:ecommerce/features/auth/data/repositories/auth_repository_impl.dart'
    as _i689;
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart'
    as _i33;
import 'package:ecommerce/features/auth/domain/use_cases/login.dart' as _i658;
import 'package:ecommerce/features/auth/domain/use_cases/register.dart'
    as _i696;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i350;
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_api_remote_data_source.dart'
    as _i971;
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart'
    as _i328;
import 'package:ecommerce/features/cart/data/repositories/cart_repository_impl.dart'
    as _i222;
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart'
    as _i487;
import 'package:ecommerce/features/cart/domain/use_cases/add_to_cart.dart'
    as _i804;
import 'package:ecommerce/features/cart/domain/use_cases/delete_from_cart.dart'
    as _i524;
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart'
    as _i514;
import 'package:ecommerce/features/cart/domain/use_cases/update_cart.dart'
    as _i86;
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart'
    as _i769;
import 'package:ecommerce/features/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i24;
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i329;
import 'package:ecommerce/features/home/data/repositories/home_repository_impl.dart'
    as _i1028;
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart'
    as _i572;
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart'
    as _i533;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i669;
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_api_data_source.dart'
    as _i18;
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_source.dart'
    as _i738;
import 'package:ecommerce/features/products/data/repositories/products_repository_impl.dart'
    as _i969;
import 'package:ecommerce/features/products/domain/repositories/products_repository.dart'
    as _i994;
import 'package:ecommerce/features/products/domain/use_cases/get_products_use_case.dart'
    as _i195;
import 'package:ecommerce/features/products/presentation/cubit/products_cubit.dart'
    as _i382;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.getSharedPref,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i738.ProductsRemoteDataSource>(
        () => _i18.ProductsRemoteApiDataSource(gh<_i361.Dio>()));
    gh.singleton<_i385.AuthRemoteDataSource>(
        () => _i407.AuthApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i329.HomeRemoteDataSource>(
        () => _i24.HomeApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i328.CartRemoteDataSource>(
        () => _i971.CartApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i572.HomeRepository>(
        () => _i1028.HomeRepositoryImpl(gh<_i329.HomeRemoteDataSource>()));
    gh.lazySingleton<_i487.CartRepository>(
        () => _i222.CartRepositoryImpl(gh<_i328.CartRemoteDataSource>()));
    gh.lazySingleton<_i804.AddToCart>(
        () => _i804.AddToCart(gh<_i487.CartRepository>()));
    gh.lazySingleton<_i524.DeleteFromCart>(
        () => _i524.DeleteFromCart(gh<_i487.CartRepository>()));
    gh.lazySingleton<_i514.GetCart>(
        () => _i514.GetCart(gh<_i487.CartRepository>()));
    gh.lazySingleton<_i86.UpdateCart>(
        () => _i86.UpdateCart(gh<_i487.CartRepository>()));
    gh.singleton<_i74.AuthLocalDataSource>(() =>
        _i258.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i994.ProductsRepository>(() =>
        _i969.ProductsRepositoryImpl(gh<_i738.ProductsRemoteDataSource>()));
    gh.lazySingleton<_i533.GetCategories>(
        () => _i533.GetCategories(gh<_i572.HomeRepository>()));
    gh.factory<_i669.HomeCubit>(
        () => _i669.HomeCubit(gh<_i533.GetCategories>()));
    gh.lazySingleton<_i769.CartCubit>(() => _i769.CartCubit(
          gh<_i804.AddToCart>(),
          gh<_i514.GetCart>(),
          gh<_i524.DeleteFromCart>(),
          gh<_i86.UpdateCart>(),
        ));
    gh.lazySingleton<_i195.GetProductsUseCase>(
        () => _i195.GetProductsUseCase(gh<_i994.ProductsRepository>()));
    gh.factory<_i382.ProductsCubit>(
        () => _i382.ProductsCubit(gh<_i195.GetProductsUseCase>()));
    gh.singleton<_i33.AuthRepository>(() => _i689.AuthRepositoryImpl(
          gh<_i385.AuthRemoteDataSource>(),
          gh<_i74.AuthLocalDataSource>(),
        ));
    gh.singleton<_i658.Login>(() => _i658.Login(gh<_i33.AuthRepository>()));
    gh.singleton<_i696.Register>(
        () => _i696.Register(gh<_i33.AuthRepository>()));
    gh.singleton<_i350.AuthCubit>(() => _i350.AuthCubit(
          gh<_i696.Register>(),
          gh<_i658.Login>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i709.RegisterModule {}
