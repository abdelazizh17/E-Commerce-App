import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/write_review_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingsAndReviewsButtonSection extends StatelessWidget {
  const RatingsAndReviewsButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return CustomButton(
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return WriteReviewBottomSheet(mediaQuery: mediaQuery);
            });
      },
      padding: EdgeInsets.all(15),
      width: 128.w,
      height: 36.h,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.pen,
            size: 20,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Write a review',
            style: AppStyles.styleSimiBold11(),
          ),
        ],
      ),
    );
  }
}

