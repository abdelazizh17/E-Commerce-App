import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_info_section.dart';
import 'package:flutter/widgets.dart';

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
