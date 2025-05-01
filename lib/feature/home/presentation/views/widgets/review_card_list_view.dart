import '../../../../bag/data/models/product/product.dart';
import 'review_card.dart';
import 'package:flutter/material.dart';

class ReviewCardSliverList extends StatelessWidget {
  const ReviewCardSliverList({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: product.reviews!.length,
      itemBuilder: (context, index) {
        return ReviewCard(
          review: product.reviews![index],
        );
      },
    );
  }
}
