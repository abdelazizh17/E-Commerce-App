import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearGradientContainer extends StatelessWidget {
  const LinearGradientContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // here
      height: 135.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: Theme.of(context).brightness == Brightness.light
              ? [
                  AppColors.lightModeBackgroundColor,
                  AppColors.lightModeBackgroundColor.withAlpha(255),
                  AppColors.lightModeBackgroundColor.withAlpha(0),
                ]
              : [
                  AppColors.darkModeBackgroundColor,
                  AppColors.darkModeBackgroundColor.withAlpha(255),
                  AppColors.darkModeBackgroundColor.withAlpha(0),
                ],
        ),
      ),
    );
  }
}
