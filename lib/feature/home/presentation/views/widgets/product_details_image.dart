import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275.w,
      height: 413.h,
      decoration: BoxDecoration(
        color: Color(0xffEFEEEC),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: imageUrl,
        placeholder: (context, url) => Center(
          child: LottieBuilder.asset(
            Assets.imagesLoading,
            width: 150.w,
            height: 150.h,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
