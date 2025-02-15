import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomQuickAuthButton extends StatelessWidget {
  const CustomQuickAuthButton({
    super.key,
    required this.image,
    this.onPressed,
  });
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 64,
      ),
      child: AspectRatio(
        aspectRatio: 1.46,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: AppColors.whiteColor,
          ),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
