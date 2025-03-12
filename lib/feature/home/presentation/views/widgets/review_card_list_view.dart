import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/review_card.dart';
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

