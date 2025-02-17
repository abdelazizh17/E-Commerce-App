import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key, this.onPressed, required this.icon, required this.title});
  final Function()? onPressed;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: AppStyles.styleSimiBold16(context),
            ),
            const Spacer(),
            if (onPressed != null)
              const Icon(Icons.arrow_forward_ios, size: 16)
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
