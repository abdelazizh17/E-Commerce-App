import '../../../data/models/product/product.dart';
import '../../../../../core/utils/app_colors.dart';
import 'popup_menu_and_price_section.dart';
import 'product_image.dart';
import 'product_info_section_bag.dart';
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
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 12,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
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
