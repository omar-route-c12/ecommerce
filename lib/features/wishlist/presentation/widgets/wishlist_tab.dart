import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatefulWidget {
  const WishlistTab({super.key});

  @override
  State<WishlistTab> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab> {
  @override
  void initState() {
    super.initState();
    context.read<WishListCubit>().getUserWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListStates>(
      builder: (context, state) {
        if (state is GetUserWishListLoadingState) {
          return const LoadingIndicator();
        } else if (state is GetUserWishListErrorState) {
          return ErrorIndicator(state.message);
        } else {
          final products = context.read<WishListCubit>().products;
          if (products.isEmpty) {
            return Center(
              child: Text(
                "Your wishlist is empty!",
                style: getSemiBoldStyle(
                    color: ColorManager.primary, fontSize: 25.sp),
              ),
            );
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, index) => WishlistItem(product: products[index]),
          );
        }
      },
    );
  }
}
