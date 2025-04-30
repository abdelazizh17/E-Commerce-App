import 'package:e_commerce/feature/shop/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductsViewBody(
        category: category,
      ),
    );
  }
}
