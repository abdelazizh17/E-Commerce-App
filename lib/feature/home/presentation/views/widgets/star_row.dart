import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class StarRow extends StatelessWidget {
  const StarRow({
    super.key,
    required this.starLevel,
  });
  final int starLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (i) => Icon(
          Icons.star,
          size: 20,
          color: i < starLevel ? AppColors.yellowColor : Colors.transparent,
        ),
      ).reversed.toList(),
    );
  }
}
