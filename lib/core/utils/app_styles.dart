import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle styleMedium14() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMediumTheme14(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegularGrey11() {
    return TextStyle(
      color: AppColors.greyColor,
      fontSize: 11.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular11(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 11.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14GreyAndDark(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.greyColor
          : AppColors.blackColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegularGrey14() {
    return TextStyle(
      color: AppColors.greyColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 16.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSimiBold11() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: 11.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSimiBold16(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 16.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSimiBold18(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 18.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSimiBold24(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 24.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSimiBold44(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 44.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold34(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.whiteColor
          : AppColors.blackColor,
      fontSize: 34.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold48() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: 48.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w900,
    );
  }
}
