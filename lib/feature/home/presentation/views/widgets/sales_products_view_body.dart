import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_skeletoizer_product_card.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/filter_buttons_row.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/products_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesProductsViewBody extends StatefulWidget {
  const SalesProductsViewBody({super.key});

  @override
  State<SalesProductsViewBody> createState() => _SalesProductsViewBodyState();
}

class _SalesProductsViewBodyState extends State<SalesProductsViewBody> {
  late final ScrollController _scrollController;
  late List<Product> products = [];

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    context.read<GetAllProductsCubit>().getAllProducts();
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      _loadMoreData();
    }
  }

  void _loadMoreData() {
    final cubit = context.read<GetAllProductsCubit>();
    final state = cubit.state;

    if (state is SortedProductsSuccess) {
    } else if (state is GetAllProductsSuccess) {
      cubit.getAllProducts(loadMore: true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllProductsCubit, GetAllProductsState>(
      listener: (context, state) {
        if (state is GetAllProductsSuccess) {
          products = state.products;
        } else if (state is SortedProductsSuccess) {
          products = state.sortedProduct;
        }
        if (state is GetAllProductsFailure) {
          showSnackBar(context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSliverAppBar(
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: AppColors.whiteColor,
              ),
              title: Text(
                'Sales',
                style: AppStyles.styleSimiBold18(context).copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
              pinned: true,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkModeBackgroundColor
                  : AppColors.primaryColor,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            FilterButtonsRow(),
            (state is GetAllProductsLoading)
                ? const SliverFillRemaining(
                    child: Center(
                      child: CustomSkeletonizerProductCardGridView(),
                    ),
                  )
                : ProductsSliverGrid(products: products),
          ],
        );
      },
    );
  }
}
