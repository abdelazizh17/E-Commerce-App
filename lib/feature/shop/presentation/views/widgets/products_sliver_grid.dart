import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/product_card.dart';
import 'package:flutter/widgets.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ProductCard(
            product: products[index],
            isLoading: false,
          ),
        ),
        childCount: products.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 0.54,
      ),
    );
  }
}

