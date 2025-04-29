import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/popup_menu_and_price_section.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/product_image.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/product_info_section_bag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBagCard extends StatelessWidget {
  const ProductBagCard(
      {super.key, required this.isLoading, required this.product});
  final bool isLoading;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 104.h,
      decoration: ShapeDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.transparent
            : AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 25,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: isLoading
                ? SizedBox.shrink()
                : ProductImage(
                    product: product,
                  ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: ProductInfoSectionBag(product: product),
                  ),
                  Expanded(
                    flex: 1,
                    child: PopupMenuAndPriceSection(product: product),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
