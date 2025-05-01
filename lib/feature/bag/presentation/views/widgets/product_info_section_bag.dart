import '../../../data/models/product/product.dart';
import '../../../../../core/utils/app_styles.dart';
import 'increase_and_decrease_product_section.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoSectionBag extends StatelessWidget {
  const ProductInfoSectionBag({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 4.h,
        ),
        Text(
          product.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.styleSimiBold18(context),
        ),
        SizedBox(
          height: 16.h,
        ),
        IncreaseAndDecreaseProductSection(
          product: product,
        ),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }
}
