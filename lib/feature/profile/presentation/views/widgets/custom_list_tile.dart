import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final String title;

  final String subtitle;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(
          title,
          style: AppStyles.styleSimiBold16(),
        ),
        subtitle: Text(
          subtitle,
          style: AppStyles.styleRegularGrey11(),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: AppColors.greyColor,
        ),
      ),
    );
  }
}
