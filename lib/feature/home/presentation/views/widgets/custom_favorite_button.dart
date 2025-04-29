import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
    super.key,
    this.onPressed,
    required this.isFavorite,
  });
  final void Function()? onPressed;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 36,
        height: 36,
        decoration: ShapeDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.transparent
              : AppColors.whiteColor,
          shape: OvalBorder(),
          shadows: [
            Theme.of(context).brightness == Brightness.dark
                ? BoxShadow(
                    color: Color(0x420A0A0A),
                    blurRadius: 8,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                : BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
          ],
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            isFavorite ? FontAwesomeIcons.solidHeart : LucideIcons.heart,
            size: 14,
            color: isFavorite ? AppColors.primaryColor : AppColors.greyColor,
          ),
        ));
  }
}
