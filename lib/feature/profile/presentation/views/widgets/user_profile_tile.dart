import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage(Assets.imagesProf1),
        ),
        SizedBox(
          width: 19,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Matilda Brown',
              style: AppStyles.styleSimiBold18(),
            ),
            Text(
              'matildabrown@mail.com',
              style: AppStyles.styleMediumWhite14().copyWith(
                color: AppColors.greyColor,
              ),
            )
          ],
        )
      ],
    );
  }
}