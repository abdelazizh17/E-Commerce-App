import 'package:e_commerce/feature/bag/data/models/product/review.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/helpfull_row.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_and_data_row.dart';
import 'package:flutter/material.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({
    super.key,
    required this.review,
    required this.formattedDate,
  });

  final Review review;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkModeBackgroundColor
            : AppColors.whiteColor,
        shadows: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 12,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            review.reviewerName?.toString() ?? 'Anonymous',
            style: AppStyles.styleSimiBold16(context),
          ),
          const SizedBox(height: 8),
          RatingAndDateRow(review: review, formattedDate: formattedDate),
          const SizedBox(height: 11),
          Flexible(
            child: Text(
              review.comment ?? 'No review available',
              style: AppStyles.styleRegular14(context),
            ),
          ),
          const SizedBox(height: 10),
          const HelpfulRow(),
        ],
      ),
    );
  }
}
