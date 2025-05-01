import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_sliver_app_bar.dart';
import 'setting_items_list.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          title: Text(
            'Setting',
            style: AppStyles.styleSimiBold16(context),
          ),
        ),
        SettingItemsList(),
      ],
    );
  }
}
