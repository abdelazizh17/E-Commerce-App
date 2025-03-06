import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CountLabel extends StatelessWidget {
  const CountLabel({
    super.key,
    required this.count,
  });
  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: AppStyles.styleRegular14GreyAndDark(context),
      textAlign: TextAlign.end,
    );
  }
}
