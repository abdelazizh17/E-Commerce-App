import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 275,
            height: 413,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.images![0]),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
