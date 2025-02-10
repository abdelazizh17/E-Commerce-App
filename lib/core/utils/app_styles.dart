import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle styleMediumWhite14() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMediumBlack14() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleRegular10() {
    return TextStyle(
      color: AppColors.greyColor,
      fontSize: 10.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
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

  static TextStyle styleRegularBlack11() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 11.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular14() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 14.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular16() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 16.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSimiBold16() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 16.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSimiBold18() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 18.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSimiBoldWhite24() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: 24.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSimiBoldBlack24() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 24.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBoldBlack34() {
    return TextStyle(
      color: AppColors.blackColor,
      fontSize: 34.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBoldWhite34() {
    return TextStyle(
      color: AppColors.whiteColor,
      fontSize: 34.sp,
      fontFamily: 'Metropolis',
      fontWeight: FontWeight.w700,
    );
  }
}
