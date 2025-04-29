import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/sale_product_card.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizerProductCardListView extends StatelessWidget {
  const CustomSkeletonizerProductCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.43,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
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
}

class CustomSkeletonizerProductCardGridView extends StatelessWidget {
  const CustomSkeletonizerProductCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GridView.builder(
        itemCount: getDummyList().length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 0.54,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ProductCard(
            product: getDummyList()[index],
            isLoading: true,
          ),
        ),
      ),
    );
  }
}

List<Product> getDummyList() {
  return List.generate(
      6,
      (index) => Product(
            rating: 4,
            price: 12,
            discountPercentage: 12,
            images: ['assets/images/test.png'],
          ));
}
