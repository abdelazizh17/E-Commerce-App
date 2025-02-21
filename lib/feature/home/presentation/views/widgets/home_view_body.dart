import 'package:e_commerce/feature/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_new_product_card_list_view.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_sale_product_card_list_view.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/header_tile.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomHomeSliverAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        SliverToBoxAdapter(
          child: HeaderTile(
            title: 'Sale',
            subtitle: 'Super summer sale',
          ),
        ),
        SliverToBoxAdapter(
          child: CustomSaleProductCardListView(),
        ),
        SliverToBoxAdapter(
          child: HeaderTile(
            title: 'New',
            subtitle: 'You’ve never seen it before!',
          ),
        ),
        SliverToBoxAdapter(
          child: CustomNewProductCardListView(),
        ),
      ],
    );
  }
}
