import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.22,
            ),
            Image.asset(
              Assets.imagesBags,
            ),
            SizedBox(
              height: height / 18,
            ),
            Text(
              'Success!',
              style: AppStyles.styleBold34(context),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Your order will be delivered soon.\nThank you for choosing our app!',
              style: AppStyles.styleRegular14(context),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.homeLayout, (Route<dynamic> route) => false);
              },
              widget: Text(
                'CONTINUE SHOPPING',
                style: AppStyles.styleMedium14(),
              ),
              height: 50.h,
            )
          ],
        ),
      ),
    );
  }
}
