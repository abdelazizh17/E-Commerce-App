import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/sale_product_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizerProductCard extends StatelessWidget {
  const CustomSkeletonizerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getDummyList().length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 22),
          child: SaleProductCard(
            product: getDummyList()[index],
            isLoading: true,
          ),
        ),
      ),
    ));
  }

  static List<Product> getDummyList() {
    return List.generate(
        7,
        (index) => Product(
              rating: 4,
              price: 12,
              discountPercentage: 12,
              images: ['assets/images/test.png'],
            ));
  }
}
