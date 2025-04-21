import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/accessories_tab.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/electronics_tab.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/furniture_tab.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/groceries_tab.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/men_tab.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/personal_care_tab.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/tab_bar_delegate.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/vehicles_tab.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/women_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      "Women",
      "Men",
      "Beauty & Personal Care",
      "Home & Furniture",
      "Groceries",
      "Electronics",
      "Accessories & Gadgets",
      "Vehicles"
    ];
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.primaryColor,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 8),
                centerTitle: true,
                title: Text(
                  'Shop',
                  style: AppStyles.styleBold34(context).copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w900,
                    // fontSize: 28,
                  ),
                ),
                background: Image.asset(
                  Assets.imagesShop,
                  fit: BoxFit.fill,
                ),
              ),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            SliverPersistentHeader(
              delegate: TabBarDelegate(
                TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  isScrollable: true,
                  indicatorWeight: 4,
                  labelColor: Theme.of(context).brightness == Brightness.light
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                  unselectedLabelColor:
                      Theme.of(context).brightness == Brightness.light
                          ? AppColors.darkModeBackgroundColor
                          : AppColors.greyColor,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.primaryColor,
                  labelStyle: AppStyles.styleSimiBold16(context),
                  tabs: tabs.map((tabName) => Tab(text: tabName)).toList(),
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          children: 
          
          [
            WomenTab(),
            MenTab(),
            PersonalCareTab(),
            FurnitureTab(),
            GroceriesTab(),
            ElectronicsTab(),
            AccessoriesTab(),
            VehiclesTab(),
          ],
        ),
      ),
    );
  }
}
