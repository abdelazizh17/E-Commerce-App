import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_quick_auth_button.dart';
import 'package:flutter/material.dart';

class CustomQuickAuthButtonSection extends StatelessWidget {
  const CustomQuickAuthButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomQuickAuthButton(
          image: Assets.imagesGoogle,
        ),
        SizedBox(
          width: 16,
        ),
        CustomQuickAuthButton(
          image: Assets.imagesFacebook,
        ),
      ],
    );
  }
}