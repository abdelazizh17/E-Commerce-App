import '../utils/app_colors.dart';
import '../utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverHeader extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool pinned;
  final bool floating;
  final double height;
  final bool centerTitle;
  final List<Widget>? actions;
  final EdgeInsets? titlePadding;
  final Color backgroundColor;
  final bool forceElevated;

  const CustomSliverHeader({
    super.key,
    required this.title,
    required this.imagePath,
    this.pinned = false,
    this.floating = false,
    required this.height,
    this.centerTitle = false,
    this.actions,
    this.titlePadding,
    required this.backgroundColor,
    this.forceElevated = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      actions: actions,
      backgroundColor: backgroundColor,
      pinned: pinned,
      floating: floating,
      expandedHeight: height,
      forceElevated: forceElevated,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: centerTitle,
        titlePadding: titlePadding ?? EdgeInsets.only(left: 18, bottom: 30.sp),
        title: Text(
          title,
          style: AppStyles.styleBold34(context).copyWith(
              color: AppColors.whiteColor, fontWeight: FontWeight.w900),
        ),
        background: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
