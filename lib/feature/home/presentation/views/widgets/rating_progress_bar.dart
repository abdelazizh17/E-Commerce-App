import 'package:flutter/material.dart';

class RatingProgressBar extends StatelessWidget {
  const RatingProgressBar({
    super.key,
    required this.count,
    required this.maxCount,
    required this.ratingCounts,
  });
  final int count;
  final int maxCount;
  final List<int> ratingCounts;
  @override
  Widget build(BuildContext context) {
    // final totalCount = ratingCounts.reduce((a, b) => a + b);
    // final value = totalCount > 0 ? count / totalCount : 0.0; // That's if we need to fix the value based on the total of ratingCounts
    final value = maxCount > 0
        ? count / maxCount
        : 0.0; // That's if we need to fix the value at one
    return LinearProgressIndicator(
      borderRadius: BorderRadius.circular(28),
      value: value == 0 ? 0.08 : value,
      minHeight: 10,
      backgroundColor: Colors.transparent,
      color: Colors.red,
    );
  }
}
