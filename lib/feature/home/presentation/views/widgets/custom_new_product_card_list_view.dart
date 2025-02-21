import 'package:e_commerce/feature/home/presentation/views/widgets/new_product_card.dart';
import 'package:flutter/material.dart';

class CustomNewProductCardListView extends StatelessWidget {
  const CustomNewProductCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 22),
          child: NewProductCard(),
        ),
      ),
    );
  }
}