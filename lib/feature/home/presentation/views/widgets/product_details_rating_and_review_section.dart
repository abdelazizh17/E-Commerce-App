import '../../../../bag/data/models/product/product.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsRatingAndReviewsSection extends StatelessWidget {
  const ProductDetailsRatingAndReviewsSection({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.ratingAndReviewsView,
            arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rating & Reviews',
              style: AppStyles.styleRegular16(context),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
