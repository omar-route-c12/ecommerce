import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/home_screen_app_bar.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_state.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen();

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const HomeScreenAppBar(
        automaticallyImplyLeading: true,
      ),
      body: BlocProvider(
        create: (context) => serviceLocator.get<ProductsCubit>()
          ..getProducts(categoryId: productId),
        child: BlocListener<CartCubit, CartState>(
          listener: (context, state) {
            if (state is AddToCartLoadingState) {
              UIUtils.showLoading(context);
            } else if (state is AddToCartErrorState) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.message);
            } else if (state is AddToCartSuccessState) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage('Product Added To Cart Successfully');
            }
          },
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is GetProductsLoadingState) {
                return const LoadingIndicator();
              } else if (state is GetProductsErrorState) {
                return ErrorIndicator(state.message);
              } else if (state is GetProductsSuccessState) {
                final products = state.products;
                return products.isEmpty
                    ? Center(
                        child: Text(
                          'No Products',
                          style: getSemiBoldStyle(
                              color: ColorManager.primary, fontSize: 25.sp),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 6 / 9,
                        ),
                        itemBuilder: (_, index) => ProductItem(products[index]),
                        itemCount: products.length,
                        padding: EdgeInsets.all(Insets.s16.sp),
                      );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
