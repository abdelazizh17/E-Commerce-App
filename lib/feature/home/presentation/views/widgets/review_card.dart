import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/data/models/product/review.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/avatar_image.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_review_card.dart';
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
