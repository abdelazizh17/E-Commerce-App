import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/tab_bar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverPersistentHeaderSection extends StatelessWidget {
  const SliverPersistentHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: TabBarDelegate(
        TabBar(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          isScrollable: true,
          indicatorWeight: 4,
          labelColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.blackColor
              : AppColors.whiteColor,
          unselectedLabelColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.darkModeBackgroundColor
              : AppColors.greyColor,
          tabAlignment: TabAlignment.start,
          indicatorColor: AppColors.primaryColor,
          labelStyle: AppStyles.styleSimiBold16(context),
          tabs: tabs.map((tabName) => Tab(text: tabName)).toList(),
        ),
      ),
      pinned: true,
    );
  }
}
