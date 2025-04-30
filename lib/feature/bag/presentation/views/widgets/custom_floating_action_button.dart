import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    this.onPressed,
    required this.iconData, this.heroTag,
  });
  final Function()? onPressed;
  final IconData iconData;
  final Object? heroTag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      heroTag: heroTag,
      onPressed: onPressed,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkModeBackgroundColor
          : AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Icon(
        iconData,
        color: AppColors.greyColor,
      ),
    );
  }
}
