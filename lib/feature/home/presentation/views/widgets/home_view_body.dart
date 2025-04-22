import 'package:e_commerce/feature/home/presentation/views/widgets/bloc_builder_new_product_card_list_view.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/bloc_builder_sale_product_card_list_view.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/header_tile.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/home_sliver_app_bar_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeSliverAppBarSection(),
        // CustomHomeSliverAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: HeaderTile(
            title: 'Sale',
            subtitle: 'Super summer sale',
            onPressed: () {},
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

