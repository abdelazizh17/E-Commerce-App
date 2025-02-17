import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.lightModeBackgroundColor,
  iconTheme: IconThemeData(
    size: 24,
    color: AppColors.blackColor,
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarHeight: 50.h,
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.darkModeBackgroundColor,
  iconTheme: IconThemeData(
    size: 24,
    color: AppColors.whiteColor,
  ),

  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: AppColors.whiteColor,
      size: 25,
    ),
    elevation: 0,
    toolbarHeight: 50.h,
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
  ),
);
