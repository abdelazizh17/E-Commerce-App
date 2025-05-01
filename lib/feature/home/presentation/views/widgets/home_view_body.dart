import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.dart';
import 'bloc_builder_new_product_card_list_view.dart';
import 'bloc_builder_sale_product_card_list_view.dart';
import 'header_tile.dart';
import 'home_sliver_app_bar_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeSliverAppBarSection(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: HeaderTile(
            title: 'Sale',
            subtitle: 'Super summer sale',
            onPressed: () {
              Navigator.pushNamed(context, Routes.salesProductsView);
            },
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilderSaleProductCardListView(),
        ),
        SliverToBoxAdapter(
          child: HeaderTile(
            title: 'New',
            subtitle: 'You’ve never seen it before!',
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilderNewProductCardListView(),
        ),
      ],
    );
  }
}
