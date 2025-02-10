import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AlreadyHaveAnAccountSection extends StatelessWidget {
  const AlreadyHaveAnAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'Already have an account?',
            style: AppStyles.styleMediumBlack14(),
          ),
        ),
        SizedBox(width: 8),
        Icon(
          LucideIcons.moveRight,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
