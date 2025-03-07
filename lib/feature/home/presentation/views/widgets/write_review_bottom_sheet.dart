import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteReviewBottomSheet extends StatelessWidget {
  const WriteReviewBottomSheet({
    super.key,
    required this.mediaQuery,
  });

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 14.sp,
        left: 16.sp,
        right: 16.sp,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      width: mediaQuery.size.width,
      height: mediaQuery.size.height * 0.7,
      decoration: BoxDecoration(
        color: AppColors.lightModeBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 6,
              decoration: ShapeDecoration(
                color: AppColors.greyColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'What is you rate?',
              style: AppStyles.styleSimiBold18(context),
            ),
            SizedBox(
              height: 17,
            ),
            StarRating(
              size: 50,
            ),
            SizedBox(
              height: mediaQuery.size.height / 28,
            ),
            Text(
              'Please share your opinion\nabout the product',
              style: AppStyles.styleSimiBold18(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 18,
            ),
            CustomTextFormField(
              maxLines: 8,
              hintText: 'Your review',
            ),
            SizedBox(
              height: mediaQuery.size.height / 20,
            ),
            CustomButton(
                onPressed: () {},
                widget: Text(
                  'Send Review',
                  style: AppStyles.styleMedium14(),
                ),
                height: 50.h),
          ],
        ),
      ),
    );
  }
}
