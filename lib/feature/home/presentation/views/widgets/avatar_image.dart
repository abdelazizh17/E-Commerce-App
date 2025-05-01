import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';

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
