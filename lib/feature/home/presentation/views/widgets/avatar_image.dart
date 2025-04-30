import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 5,
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(Assets.imagesProf1),
      ),
    );
  }
}
