import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/custom_divider.dart';
import 'profile_item.dart';

class ProfileFooterSection extends StatelessWidget {
  const ProfileFooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileItem(
            onPressed: () {},
            title: 'My orders',
            subtitle: 'Already have 12 orders',
          ),
          CustomDivider(),
          ProfileItem(
            onPressed: () {},
            title: 'Shipping addresses',
            subtitle: '3 ddresses',
          ),
          CustomDivider(),
          ProfileItem(
            onPressed: () {},
            title: 'Payment methods',
            subtitle: 'Visa  **34',
          ),
          CustomDivider(),
          ProfileItem(
            onPressed: () {},
            title: 'Promocodes',
            subtitle: 'You have special promocodes',
          ),
          CustomDivider(),
          ProfileItem(
            onPressed: () {},
            title: 'My reviews',
            subtitle: 'Reviews for 4 items',
          ),
          CustomDivider(),
          ProfileItem(
            onPressed: () {
              Navigator.pushNamed(context, Routes.settingView);
            },
            title: 'Settings',
            subtitle: 'Notifications, password',
          ),
        ],
      ),
    );
  }
}
