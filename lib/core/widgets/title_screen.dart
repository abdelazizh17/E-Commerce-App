import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.styleBold34(context),
    );
  }
}