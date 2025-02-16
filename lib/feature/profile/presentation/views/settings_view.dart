import 'package:e_commerce/feature/profile/presentation/views/widgets/setting_view_body.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SettingViewBody(),
      ),
    );
  }
}
