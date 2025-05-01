import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class AlreadyHaveAnAccountAndForgotPasswordSection extends StatelessWidget {
  const AlreadyHaveAnAccountAndForgotPasswordSection(
      {super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: AppStyles.styleMediumTheme14(context),
          ),
          SizedBox(width: 8),
          Icon(
            LucideIcons.moveRight,
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
