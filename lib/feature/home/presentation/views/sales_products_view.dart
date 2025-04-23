import 'package:e_commerce/feature/home/presentation/views/widgets/sales_products_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SalesProductsView extends StatelessWidget {
  const SalesProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SalesProductsViewBody(),
    );
  }
}
