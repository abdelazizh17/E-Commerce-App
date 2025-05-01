import '../../../../../core/routes/routes.dart';
import '../../../../auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'dark_mode_toggle.dart';
import 'setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoggedOut) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.signUpView,
                  (route) => false,
                );
              }
            },
            child: SettingItem(
              icon: Icons.logout,
              title: 'Logout',
              onPressed: () {
                AuthCubit.get(context).signOutAllAccounts();
              },
            ),
          ),
        ],
      ),
    );
  }
}
