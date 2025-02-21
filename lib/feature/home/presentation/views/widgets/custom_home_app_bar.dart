import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeSliverAppBar extends StatelessWidget {
  const CustomHomeSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkModeBackgroundColor
          : AppColors.lightModeBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 18, bottom: 30.sp),
        title: Text(
          'Fashion\nsale',
          style: AppStyles.styleBold34(context).copyWith(
              color: AppColors.whiteColor, fontWeight: FontWeight.w900),
        ),
        background: Image.asset(
          Assets.imagesFashon,
          fit: BoxFit.cover,
        ),
      ),
      pinned: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.65,
    );
  }
}
