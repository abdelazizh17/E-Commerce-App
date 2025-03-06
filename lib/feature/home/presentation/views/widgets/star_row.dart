import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StarRow extends StatelessWidget {
  const StarRow({
    super.key,
    required this.starCount,
  });
  final int starCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (i) => Icon(
          Icons.star,
          size: 20,
          color: i < starCount ? AppColors.yellowColor : Colors.transparent,
        ),
      ).reversed.toList(),
    );
  }
}
