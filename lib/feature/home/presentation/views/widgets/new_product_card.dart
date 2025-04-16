import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewProductCard extends StatelessWidget {
  const NewProductCard(
      {super.key, required this.product, required this.isLoading});
  final Product product;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageContainer(
          isSale: false,
          products: product,
          isLoading: isLoading,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StarRating(
                size: 20,
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
              Text(
                "${product.price!.toStringAsFixed(2)}\$",
                style: AppStyles.styleMedium14().copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
