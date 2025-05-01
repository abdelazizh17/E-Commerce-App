import 'dart:ui';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeSliverAppBarSection extends StatelessWidget {
  const HomeSliverAppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSliverHeader(
      title: 'Fashion\nsale',
      imagePath: Assets.imagesFashon,
      height: MediaQuery.of(context).size.height * 0.65,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkModeBackgroundColor
          : AppColors.lightModeBackgroundColor,
    );
  }
}
