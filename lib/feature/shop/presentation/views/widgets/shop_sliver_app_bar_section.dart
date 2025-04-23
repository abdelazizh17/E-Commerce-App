import 'dart:ui';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/custom_sliver_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopSliverAppBarSection extends StatelessWidget {
  const ShopSliverAppBarSection({
    super.key,
    required this.forceElevated,
  });
  final bool forceElevated;
  @override
  Widget build(BuildContext context) {
    return CustomSliverHeader(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkModeBackgroundColor
          : AppColors.primaryColor,
      height: MediaQuery.of(context).size.height * 0.5,
      imagePath: Assets.imagesShop,
      title: 'Shop',
      centerTitle: true,
      pinned: true,
      floating: true,
      forceElevated: forceElevated,
      titlePadding: EdgeInsets.only(bottom: 8),
    );
  }
}
