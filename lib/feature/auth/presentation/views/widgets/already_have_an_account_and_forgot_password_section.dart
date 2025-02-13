import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
            style: AppStyles.styleMediumBlack14(),
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
