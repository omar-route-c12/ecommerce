import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:ecommerce/features/cart/presentation/widgets/total_price_and_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final CartCubit _cartCubit = context.read<CartCubit>();

  @override
  void initState() {
    super.initState();
    _cartCubit.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.text),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.s14.sp),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is UpdateCartLoadingState ||
                state is DeleteFromCartLoadingState) {
              UIUtils.showLoading(context);
            } else if (state is UpdateCartErrorState) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.message);
            } else if (state is DeleteFromCartErrorState) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.message);
            } else if (state is UpdateCartSuccessState ||
                state is DeleteFromCartSuccessState) {
              UIUtils.hideLoading(context);
            }
          },
          builder: (context, state) {
            if (state is GetCartLoadingState) {
              return const LoadingIndicator();
            } else if (state is GetCartErrorState) {
              return ErrorIndicator(state.message);
            } else {
              return _cartCubit.cart.items.isEmpty
                  ? Center(
                      child: Text(
                        'Your Cart is Empty',
                        style: getSemiBoldStyle(
                          color: ColorManager.primary,
                          fontSize: 25.sp,
                        ),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (_, index) => CartItem(
                              cartItemData: _cartCubit.cart.items[index],
                            ),
                            itemCount: _cartCubit.cart.items.length,
                            separatorBuilder: (_, __) =>
                                SizedBox(height: Sizes.s12.h),
                          ),
                        ),
                        TotalPriceAndCheckoutButton(
                          totalPrice: _cartCubit.cart.totalCartPrice,
                          checkoutButtonOnTap: () {},
                        ),
                        SizedBox(height: 10.h),
                      ],
                    );
            }
          },
        ),
      ),
    );
  }
}
