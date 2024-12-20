import 'dart:async';
import 'package:ecommerce/core/app_bloc_observer.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/route_generator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/wishlist/presentation/cubit/wishlist_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  final pref = serviceLocator.get<SharedPreferences>();
  final token = pref.getString(CacheConstants.tokenKey);
  final route = token == null ? Routes.login : Routes.home;
  runApp(ECommerceApp(route));
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp(this.route);

  final String route;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator.get<AuthCubit>()),
        BlocProvider(create: (_) => serviceLocator.get<CartCubit>()),
        BlocProvider(create: (_) => serviceLocator.get<WishListCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: route,
        ),
      ),
    );
  }
}
