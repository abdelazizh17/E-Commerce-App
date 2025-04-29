import 'package:e_commerce/feature/shop/data/models/category_item.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizerCategoryCard extends StatelessWidget {
  const CustomSkeletonizerCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: getDummyList().length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(16),
        child: CategoryCard(
          categoryItem: getDummyList()[index],
          isLoading: true,
        ),
      ),
    ));
  }

  static List<CategoryItem> getDummyList() {
    return List.generate(
      7,
      (index) => CategoryItem(
        imageUrl: 'assets/images/test.png',
        name: 'asdasdaasdsd',
      ),
    );
  }
}
