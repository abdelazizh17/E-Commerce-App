import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/drop_down_button_and_favorite_button_section.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_info_section.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsHeaderSection extends StatelessWidget {
  const ProductDetailsHeaderSection({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropDownButtonAndFavoriteButtonSection(
          ),
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