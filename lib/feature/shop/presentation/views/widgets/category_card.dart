import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/data/helper_methods.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryItem,
    required this.isLoading,
    this.onTap,
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
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black.withValues(alpha: 0.2)
                  : Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 12,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
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
