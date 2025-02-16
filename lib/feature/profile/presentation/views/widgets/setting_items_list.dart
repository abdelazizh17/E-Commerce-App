import 'package:e_commerce/feature/profile/presentation/views/widgets/dark_mode_toggle.dart';
import 'package:e_commerce/feature/profile/presentation/views/widgets/setting_item.dart';
import 'package:flutter/material.dart';

class SettingItemsList extends StatelessWidget {
  const SettingItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SettingItem(
            icon: Icons.notifications_none_outlined,
            title: 'Notification',
            onPressed: () {},
          ),
          SettingItem(
            icon: Icons.lock_outline,
            title: 'Security',
            onPressed: () {},
          ),
          SettingItem(
            icon: Icons.help_outline,
            title: 'Help',
            onPressed: () {},
          ),
          DarkModeToggle(),
          SettingItem(
            icon: Icons.logout,
            title: 'Logout',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
