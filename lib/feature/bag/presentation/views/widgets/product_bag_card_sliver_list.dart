import '../../../data/models/product/product.dart';
import 'product_bag_card.dart';
import 'package:flutter/material.dart';

class ProductBagCardSliverList extends StatelessWidget {
  const ProductBagCardSliverList({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: ProductBagCard(
            isLoading: false,
            product: products[index],
          ),
        );
      },
    );
  }
}
