import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/feature/shop/data/models/category_item.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/category_card.dart';
import 'package:flutter/widgets.dart';

class CategoryCardSliverListView extends StatelessWidget {
  const CategoryCardSliverListView({super.key, required this.categoryItem});
  final List<CategoryItem> categoryItem;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: categoryItem.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: CategoryCard(
            categoryItem: categoryItem[index],
            isLoading: false,
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.productsView,
                arguments: categoryItem[index].name,
              );
            },
          ),
        );
      },
    );
  }
}
