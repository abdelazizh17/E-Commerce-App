import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class RatingSummaryHeader extends StatelessWidget {
  const RatingSummaryHeader({
    super.key,
    required this.totalRatings,
    required this.product,
  });
  final int totalRatings;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.rating!.toStringAsFixed(1),
            style: AppStyles.styleSimiBold44(context)),
        Text(
          '$totalRatings ratings',
          style: AppStyles.styleRegularGrey14(),
        ),
      ],
    );
  }
}
