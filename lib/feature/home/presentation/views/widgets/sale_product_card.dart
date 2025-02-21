import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_image_container.dart';
import 'package:flutter/material.dart';

class SaleProductCard extends StatelessWidget {
  const SaleProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageContainer(
          isSale: true,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) =>
                      Icon(Icons.star, color: AppColors.yellowColor, size: 16),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Dorothy Perkins",
                style: AppStyles.styleRegularGrey11(),
              ),
              Text(
                "Evening Dress",
                style: AppStyles.styleRegular16(context),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    "15\$",
                    style: AppStyles.styleMedium14().copyWith(
                      color: AppColors.greyColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "12\$",
                    style: AppStyles.styleMedium14().copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
