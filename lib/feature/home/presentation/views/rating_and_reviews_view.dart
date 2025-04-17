import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_and_reviews_body.dart';
import 'package:flutter/material.dart';

class RatingAndReviewsView extends StatelessWidget {
  const RatingAndReviewsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text('Rating and reviews'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RatingAndReviewsBody(
        product: product,
      ),
    );
  }
}
