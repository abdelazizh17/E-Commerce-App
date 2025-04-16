import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_bars_list.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_summary_header.dart';
import 'package:flutter/material.dart';

class RatingSummary extends StatelessWidget {
  const RatingSummary({
    super.key,
    required this.totalRatings,
    required this.ratingCounts,
    required this.product,
  });

  final int totalRatings;
  final List<int> ratingCounts;
  final Product product;
  @override
  Widget build(BuildContext context) {
    final maxCount = ratingCounts
        .reduce((a, b) => a > b ? a : b); //[20, 12, 6, 4, 0] => maxCount : 20

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingSummaryHeader(
          totalRatings: totalRatings,
          product: product,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: RatingBarsList(
            ratingCounts: ratingCounts,
            maxCount: maxCount,
          ),
        ),
      ],
    );
  }
}
