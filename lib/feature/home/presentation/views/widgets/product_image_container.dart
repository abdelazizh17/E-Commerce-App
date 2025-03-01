import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductImageContainer extends StatelessWidget {
  const ProductImageContainer(
      {super.key,
      required this.isSale,
      required this.products,
      required this.isLoading});
  final bool isSale;
  final bool isLoading;
  final Product products;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 148.w,
          height: 184.h,
          decoration: ShapeDecoration(
            color: AppColors.whiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: isLoading
            ? SizedBox.shrink()
            : CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: products.images![0],
            placeholder: (context, url) =>
                LottieBuilder.asset(Assets.imagesLoading),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        isLoading
            ? SizedBox.shrink()
            : Positioned(
                left: 5,
                top: 8,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
                  decoration: ShapeDecoration(
                    color:
                        isSale ? AppColors.primaryColor : AppColors.blackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      isSale ? '-${products.discountPercentage}%' : 'NEW',
                      style: AppStyles.styleRegular11(context).copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
        isLoading
            ? SizedBox.shrink()
            : Positioned(
                right: 0,
                bottom: -18,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: ShapeDecoration(
                    color: AppColors.transparent,
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x420A0A0A),
                        blurRadius: 8,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Icon(
                    LucideIcons.heart,
                    size: 14,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
      ],
    );
  }
}
