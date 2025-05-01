import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HelpfulRow extends StatelessWidget {
  const HelpfulRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Helpful',
          style: AppStyles.styleRegularGrey11(),
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.thumb_up,
          color: AppColors.greyColor,
          size: 20,
        ),
      ],
    );
  }
}
