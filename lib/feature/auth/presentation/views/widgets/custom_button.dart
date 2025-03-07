import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.widget,
      this.padding,
      this.width = double.infinity,
      required this.height});
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Widget? widget;
  final double? width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          child: Center(
            child: widget,
          ),
        ),
      ),
    );
  }
}
