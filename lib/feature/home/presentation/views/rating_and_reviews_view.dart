import 'package:flutter/material.dart';

import '../../../bag/data/models/product/product.dart';
import 'widgets/rating_and_reviews_body.dart';

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
