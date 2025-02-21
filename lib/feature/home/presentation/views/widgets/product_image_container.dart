import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductImageContainer extends StatelessWidget {
  const ProductImageContainer({super.key, required this.isSale});
  final bool isSale;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 148.w,
          height: 184.h,
          decoration: ShapeDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                Assets.imagesTestsale,
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        Positioned(
          left: 9,
          top: 8,
          child: Container(
            width: 40,
            height: 24,
            decoration: ShapeDecoration(
              color: isSale ?  AppColors.primaryColor : AppColors.blackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
            ),
            child: Center(
              child: Text(
                isSale ? '-20%' : 'NEW',
                style: AppStyles.styleRegular11(context).copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
        Positioned(
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
