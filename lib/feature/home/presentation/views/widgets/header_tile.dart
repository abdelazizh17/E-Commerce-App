import '../../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile(
      {super.key, required this.title, required this.subtitle, this.onPressed});
  final String title, subtitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 18.sp, right: 8),
      title: Text(
        title,
        style: AppStyles.styleBold34(context),
      ),
      subtitle: Text(
        subtitle,
        style: AppStyles.styleRegularGrey11(),
      ),
      trailing: TextButton(
        onPressed: onPressed,
        child: Text(
          'View all',
          style: AppStyles.styleRegularGrey11(),
        ),
      ),
    );
  }
}
