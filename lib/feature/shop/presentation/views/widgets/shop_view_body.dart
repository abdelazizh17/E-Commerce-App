import '../../../../../constants.dart';
import 'generic_category_tab.dart';
import 'shop_sliver_app_bar_section.dart';
import 'sliver_persisten_header_section.dart';
import 'package:flutter/material.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            ShopSliverAppBarSection(
              forceElevated: innerBoxIsScrolled,
            ),
            SliverPersistentHeaderSection(),
          ];
        },
        body: TabBarView(
          children: tabs
              .map((tab) => GenericCategoryTab(
                    category: categoryMapping[tab]!,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
