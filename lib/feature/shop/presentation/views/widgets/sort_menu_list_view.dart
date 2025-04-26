import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SortMenuListView extends StatelessWidget {
  const SortMenuListView({super.key, required this.cubit});
  final GetAllProductsCubit cubit;
  @override
  Widget build(BuildContext context) {
    final Map<String, String> orderdMap = {
      'Popular': '',
      'Price: lowest to high': 'asc',
      'Price: highest to low': 'desc',
    };
    final Map<String, String> sortedByMap = {
      'Popular': 'popular',
      'Price: lowest to high': 'price',
      'Price: highest to low': 'price',
    };
    final List<String> options = [
      'Popular',
      'Price: lowest to high',
      'Price: highest to low',
    ];
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        final isSelected = index == cubit.currentIndex;
        return GestureDetector(
          onTap: () {
            cubit.changeTap(index, options[index]);
            cubit.sortProducts(
              order: orderdMap[options[index]]!,
              sortBy: sortedByMap[options[index]]!,
            );
            Future.delayed(Duration(milliseconds: 500), () {
              Navigator.pop(context);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: Color.fromRGBO(255, 0, 0, 0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : [],
            ),
            child: Text(
              options[index],
              style: TextStyle(
                color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }
}
