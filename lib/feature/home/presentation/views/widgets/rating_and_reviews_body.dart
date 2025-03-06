import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingAndReviewsBody extends StatelessWidget {
  const RatingAndReviewsBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: [
          RatingSummary(
            totalRatings: 23,
            ratingCounts: const [20, 12, 6, 4, 0],
            product: product,
          ),
        ],
      ),
    ));
  }
}
