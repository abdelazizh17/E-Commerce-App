import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinearGradientContainer extends StatelessWidget {
  const LinearGradientContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // here
      height: 135.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: Theme.of(context).brightness == Brightness.light
              ? [
                  Colors.white,
                  Colors.white.withAlpha(255),
                  Colors.white.withAlpha(0),
                ]
              : [
                  Colors.black,
                  Colors.black.withAlpha(255),
                  Colors.black.withAlpha(0),
                ],
        ),
      ),
    );
  }
}
