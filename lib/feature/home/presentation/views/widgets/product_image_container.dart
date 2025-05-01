import 'package:cached_network_image/cached_network_image.dart';
import '../../../../bag/data/models/product/product.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../favorites/presentation/viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import 'custom_favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black.withValues(alpha: 0.2)
                      : Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 12,
                  blurRadius: 20,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: isLoading
              ? SizedBox.shrink()
              : CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: products.images![0],
                  placeholder: (context, url) => Center(
                    child: LottieBuilder.asset(
                      Assets.imagesLoading,
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
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
                child:
                    BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
                  builder: (context, state) {
                    final cubit = context.read<FavoriteProductsCubit>();
                    final isFavorite = cubit.isProductFavorite(products);
                    return CustomFavoriteButton(
                      onPressed: () {
                        if (isFavorite) {
                          cubit.removeFavoriteProduct(products);
                        } else {
                          cubit.addFavoriteProduct(products);
                        }
                      },
                      isFavorite: isFavorite,
                    );
                  },
                ),
              ),
      ],
    );
  }
}
