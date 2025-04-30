import 'package:e_commerce/feature/bag/data/models/product/review.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class RatingAndDateRow extends StatelessWidget {
  const RatingAndDateRow({
    super.key,
    required this.review,
    required this.formattedDate,
  });

  final Review review;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StarRating(
          rating: review.rating?.toDouble() ?? 0.0,
        ),
        Text(
          formattedDate,
          style: AppStyles.styleRegularGrey11(),
        ),
      ],
    );
  }
}
