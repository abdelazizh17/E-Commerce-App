import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, this.onPressed, this.title, this.iconData});
  final void Function()? onPressed;
  final String? title;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.blackColor
            : AppColors.whiteColor,
        size: 22,
      ),
      label: Text(
        title ?? '',
        style: AppStyles.styleSimiBold11Theme(context),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }
}
