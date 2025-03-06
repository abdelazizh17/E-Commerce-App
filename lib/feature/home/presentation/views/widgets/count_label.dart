import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CountLabel extends StatelessWidget {
  const CountLabel({
    super.key,
    required this.ratingCount,
  });
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$ratingCount',
      style: AppStyles.styleRegular14GreyAndDark(context),
      textAlign: TextAlign.end,
    );
  }
}
