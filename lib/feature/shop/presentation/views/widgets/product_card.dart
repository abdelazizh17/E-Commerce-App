import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.product, required this.isLoading});
  final Product product;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    double discountedPrice =
        product.price! - (product.price! * (product.discountPercentage! / 100));
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetailsView,arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageContainer(
            products: product,
            isSale: true,
            isLoading: isLoading,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StarRating(
                  mainAxisAlignment: MainAxisAlignment.start,
                  color: AppColors.yellowColor,
                  size: 20,
                  rating: product.rating!,
                ),
                SizedBox(height: 4),
                Text(
                  product.brand ?? 'Unkown',
                  style: AppStyles.styleRegularGrey11(),
                ),
                SizedBox(
                  width: 120.w,
                  child: Text(
                    product.title ?? 'Unkown',
                    style: AppStyles.styleRegular16(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      Text(
                        "${product.price!.toStringAsFixed(2)}\$",
                        style: AppStyles.styleMedium14().copyWith(
                          color: AppColors.greyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        "${discountedPrice.toStringAsFixed(2)}\$",
                        style: AppStyles.styleMedium14().copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
