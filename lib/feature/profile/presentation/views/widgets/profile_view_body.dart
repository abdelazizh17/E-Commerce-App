import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/profile/presentation/views/widgets/custom_list_tile.dart';
import 'package:e_commerce/feature/profile/presentation/views/widgets/profile_header_section.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        ProfileHeaderSection(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        ProfileFooterSection()
      ],
    );
  }
}

class ProfileFooterSection extends StatelessWidget {
  const ProfileFooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          CustomListTile(
            title: 'My orders',
            subtitle: 'Already have 12 orders',
          ),
          CustomListTile(
            title: 'Shipping addresses',
            subtitle: '3 ddresses',
          ),
          CustomListTile(
            title: 'Payment methods',
            subtitle: 'Visa  **34',
          ),
          CustomListTile(
            title: 'Promocodes',
            subtitle: 'You have special promocodes',
          ),
          CustomListTile(
            title: 'My reviews',
            subtitle: 'Reviews for 4 items',
          ),
          CustomListTile(
            title: 'Settings',
            subtitle: 'Notifications, password',
          ),
        ],
      ),
    );
  }
}
