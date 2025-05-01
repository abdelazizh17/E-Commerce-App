import 'package:flutter/material.dart';

import '../../../../bag/data/models/product/product.dart';
import 'sale_product_card.dart';

class SaleProductListView extends StatelessWidget {
  final List<Product> products;
  const SaleProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 22),
          child: SaleProductCard(
            product: products[index],
            isLoading: false,
          ),
        ),
      ),
    );
  }
}
