import '../../../../../core/data/helper_methods.dart';
import '../../../../bag/data/models/product/review.dart';
import 'avatar_image.dart';
import 'custom_review_card.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});
  final Review review;

  @override
  Widget build(BuildContext context) {
    String formattedDate = review.date != null
        ? "${getMonthName(review.date!.month)} ${review.date!.day}, ${review.date!.year}"
        : "No date";

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomReviewCard(
          review: review,
          formattedDate: formattedDate,
        ),
        const AvatarImage(),
      ],
    );
  }
}
