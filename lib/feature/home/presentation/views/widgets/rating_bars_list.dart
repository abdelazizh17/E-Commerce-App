import 'package:e_commerce/feature/home/presentation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';

class RatingBarsList extends StatelessWidget {
  const RatingBarsList({
    super.key,
    required this.ratingCounts,
    required this.maxCount,
  });

  final List<int> ratingCounts;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        final starLevel = 5 - index; //5 - 0
        final ratingCount = ratingCounts[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: RatingRow(
            starLevel: starLevel,
            count: ratingCount,
            maxCount: maxCount,
            ratingCounts: ratingCounts,
          ),
        );
      }),
    );
  }
}
