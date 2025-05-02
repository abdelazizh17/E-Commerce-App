import '../../../../../core/data/helper_methods.dart';
import '../../../data/models/product/product.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../viewmodels/bag_cubit/bag_cubit.dart';
import '../../../../favorites/presentation/viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopupMenuAndPriceSection extends StatefulWidget {
  const PopupMenuAndPriceSection({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<PopupMenuAndPriceSection> createState() =>
      _PopupMenuAndPriceSectionState();
}

class _PopupMenuAndPriceSectionState extends State<PopupMenuAndPriceSection> {
  @override
  Widget build(BuildContext context) {
    double discountedPrice = widget.product.price! -
        (widget.product.price! * (widget.product.discountPercentage! / 100));
    return Column(
      children: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 1,
                child: Text('Add to favorites'),
                onTap: () {
                  final cubit = context.read<FavoriteProductsCubit>();
                  final isFavorite = cubit.isProductFavorite(widget.product);
                  if (!isFavorite) {
                    cubit.addFavoriteProduct(widget.product);
                    setState(() {
                      showSnackBar(
                        context,
                        'Added to favorites ✅',
                        AppColors.greenColor,
                      );
                    });
                  } else {
                    setState(() {
                      showSnackBar(
                        context,
                        'You’ve already added this one to favorites!',
                        AppColors.primaryColor,
                      );
                    });
                  }
                },
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Delete from the list'),
                onTap: () {
                  final cubit = context.read<BagCubit>();
                  cubit.removeBagProduct(widget.product);
                  setState(() {
                    showSnackBar(
                      context,
                      'Removed from your bag 🛍️',
                      AppColors.greenColor,
                    );
                  });
                },
              ),
            ];
          },
        ),
        SizedBox(
          height: 24.h,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "\$${discountedPrice.toStringAsFixed(2)}",
            style: AppStyles.styleMediumTheme14(context),
          ),
        ),
      ],
    );
  }
}
