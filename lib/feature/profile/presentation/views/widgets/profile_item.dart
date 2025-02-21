import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });
  final String title;

  final String subtitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 17.sp),
        title: Text(
          title,
          style: AppStyles.styleSimiBold16(context),
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
