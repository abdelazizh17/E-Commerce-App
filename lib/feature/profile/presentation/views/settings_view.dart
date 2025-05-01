import 'package:flutter/material.dart';

import 'widgets/setting_view_body.dart';

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
