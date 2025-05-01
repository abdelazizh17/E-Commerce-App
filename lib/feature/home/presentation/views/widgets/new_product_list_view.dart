import '../../../../bag/data/models/product/product.dart';
import 'new_product_card.dart';
import 'package:flutter/widgets.dart';

class NewProductListView extends StatelessWidget {
  const NewProductListView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 17, right: 17, top: 22),
          child: NewProductCard(
            product: products[index],
            isLoading: false,
          ),
        ),
      ),
    );
  }
}
