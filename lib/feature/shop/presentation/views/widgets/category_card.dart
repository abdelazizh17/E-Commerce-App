import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/shop/data/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryItem,
    required this.isLoading, this.onTap,
  });
  final CategoryItem categoryItem;
  final bool isLoading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.transparent
              : AppColors.whiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 25,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: Text(
                  formatCategoryName(categoryItem.name),
                  style: AppStyles.styleSimiBold18(context),
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? SizedBox.shrink()
                  : ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        height: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: categoryItem.imageUrl,
                        placeholder: (context, url) => Center(
                          child: LottieBuilder.asset(
                            Assets.imagesLoading,
                            width: 80.w,
                            height: 80.h,
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
