import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key, required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: CachedNetworkImage(
        height: double.infinity,
        fit: BoxFit.cover,
        imageUrl: product.images![0],
        placeholder: (context, url) => Center(
          child: LottieBuilder.asset(
            Assets.imagesLoading,
            width: 80.w,
            height: 80.h,
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
