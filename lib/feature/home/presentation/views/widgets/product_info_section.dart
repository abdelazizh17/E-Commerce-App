import 'package:e_commerce/feature/bag/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'H&M',
              style: AppStyles.styleSimiBold24(context),
            ),
            Text(
              product.price.toString(),
              style: AppStyles.styleSimiBold24(context),
            ),
          ],
        ),
        Text(
          product.title!,
          style: AppStyles.styleRegular11(context),
        ),
        SizedBox(
          height: 8,
        ),
        StarRating(
          mainAxisAlignment: MainAxisAlignment.start,
          rating: product.rating!,
        ),
        SizedBox(
          height: 16,
        ),
        Flexible(
          child: Text(
            product.description.toString(),
            style: AppStyles.styleRegular14(context),
          ),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
