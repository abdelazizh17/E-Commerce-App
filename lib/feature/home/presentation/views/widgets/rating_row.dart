import 'package:e_commerce/feature/home/presentation/views/widgets/count_label.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_progress_bar.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/star_row.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.starLevel,
    required this.count,
    required this.maxCount,
    required this.ratingCounts,
  });

  final int starLevel;
  final int count;
  final int maxCount;
  final List<int> ratingCounts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRow(starCount: starLevel),
        const SizedBox(width: 10),
        Expanded(
          child: RatingProgressBar(
            count: count,
            maxCount: maxCount,
            ratingCounts: ratingCounts,
          ),
        ),
        const SizedBox(width: 10),
        CountLabel(count: count),
      ],
    );
  }
}
