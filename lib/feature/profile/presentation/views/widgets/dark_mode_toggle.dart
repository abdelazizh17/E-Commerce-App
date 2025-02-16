import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Row(
        children: [
          const Icon(
            Icons.dark_mode_outlined,
            size: 28,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Dark Mode",
            style: AppStyles.styleSimiBold16(),
          ),
          const Spacer(),
          Switch(
            value: false,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
