import 'package:colornames/colornames.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/font_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/resources/values_manager.dart';
import 'package:ecommerce/features/wishlist/presentation/widgets/custom_auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemDetails extends StatelessWidget {
  const WishlistItemDetails({required this.product, super.key});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomAutoSizeText(
          data: product['title'],
          textStyle: getSemiBoldStyle(
            color: ColorManager.primaryDark,
            fontSize: FontSize.s18,
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: Sizes.s10.w),
              width: Sizes.s14.w,
              height: Sizes.s14.h,
              decoration: BoxDecoration(
                color: product['color'],
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: CustomAutoSizeText(
                data: (product['color'] as Color).colorName,
                textStyle: getMediumStyle(
                  color: ColorManager.primaryDark,
                  fontSize: FontSize.s14,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomAutoSizeText(
                data: 'EGP ${product['finalPrice']}  ',
                textStyle: getSemiBoldStyle(
                  color: ColorManager.primaryDark,
                  fontSize: FontSize.s18,
                ).copyWith(
                  letterSpacing: 0.17,
                ),
                maxLines: 1,
              ),
            ),
            if (product['salePrice'] != null)
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Sizes.s10.h,
                    ),
                    CustomAutoSizeText(
                      data: 'EGP ${product['salePrice']}',
                      textStyle: getMediumStyle(
                        color: ColorManager.appBarTitle.withOpacity(.6),
                      ).copyWith(
                        letterSpacing: 0.17,
                        decoration: TextDecoration.lineThrough,
                        color: ColorManager.appBarTitle.withOpacity(.6),
                        fontSize: FontSize.s10,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
