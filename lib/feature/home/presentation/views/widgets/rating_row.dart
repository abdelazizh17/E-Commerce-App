import 'count_label.dart';
import 'rating_progress_bar.dart';
import 'star_row.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.starLevel,
    required this.ratingCount,
    required this.maxCount,
    required this.ratingCounts,
  });

  final int starLevel;
  final int ratingCount;
  final int maxCount;
  final List<int> ratingCounts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StarRow(starLevel: starLevel),
        const SizedBox(width: 10),
        Expanded(
          child: RatingProgressBar(
            ratingCount: ratingCount,
            maxCount: maxCount,
            ratingCounts: ratingCounts,
          ),
        ),
        const SizedBox(width: 10),
        CountLabel(ratingCount: ratingCount),
      ],
    );
  }
}
