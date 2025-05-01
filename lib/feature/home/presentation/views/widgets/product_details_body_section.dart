import 'package:flutter/widgets.dart';

import '../../../../bag/data/models/product/product.dart';
import 'product_info_section.dart';

class ProductDetailsBodySection extends StatelessWidget {
  const ProductDetailsBodySection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          ProductInfoSection(
            product: product,
          ),
        ],
      ),
    );
  }
}
