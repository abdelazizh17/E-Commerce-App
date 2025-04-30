import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/feature/bag/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_skeletoizer_product_card.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/get_product_by_category_cubit/get_product_by_category_cubit.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/filter_buttons_row.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/products_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key, required this.category});
  final String category;
  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  List<Product> products = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    final cubit = context.read<GetProductByCategoryCubit>();
    cubit.getProductByCategory(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductByCategoryCubit, GetProductByCategoryState>(
      listener: (context, state) {
        if (state is GetProductByCategorySuccess) {
          products = state.products;
        } else if (state is GetProductByCategoryFailure) {
          showSnackBar(context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: AppColors.whiteColor,
              ),
              title: Text(
                formatCategoryName(widget.category),
                style: AppStyles.styleSimiBold18(context).copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              pinned: true,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkModeBackgroundColor
                  : AppColors.primaryColor,
            ),
            FilterButtonsRow(),
            (state is GetProductByCategoryLoading)
                ? SliverFillRemaining(
                    child: CustomSkeletonizerProductCardGridView(),
                  )
                : ProductsSliverGrid(products: products),
          ],
        );
      },
    );
  }
}
