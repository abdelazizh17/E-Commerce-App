import '../../../../../core/data/helper_methods.dart';
import '../../../../bag/data/models/product/product.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_sliver_app_bar.dart';
import 'custom_skeletoizer_product_card.dart';
import '../../../../shop/presentation/viewmodels/get_all_products_cubit/get_all_products_cubit.dart';
import '../../../../shop/presentation/views/widgets/filter_buttons_row.dart';
import '../../../../shop/presentation/views/widgets/products_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesProductsViewBody extends StatefulWidget {
  const SalesProductsViewBody({super.key});

  @override
  State<SalesProductsViewBody> createState() => _SalesProductsViewBodyState();
}

class _SalesProductsViewBodyState extends State<SalesProductsViewBody> {
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;

  late List<Product> products = [];

  bool isSearching = false;

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    _searchController = TextEditingController();

    context.read<GetAllProductsCubit>().fetchProductsPage();
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
      cubit.sortProducts(
        sortBy: cubit.currentSortBy!,
        order: cubit.currentOrder!,
        loadMore: true,
      );
    } else if (state is GetAllProductsSuccess) {
      cubit.fetchProductsPage(loadMore: true);
    }
  }

  void _onSearchChanged(String value) {
    final cubit = context.read<GetAllProductsCubit>();
    if (value.isEmpty) {
      isSearching = false;
      cubit.fetchProductsPage();
    } else {
      isSearching = true;
      cubit.searchProducts(value);
    }
  }

  void _toggleSearch() {
    if (isSearching) {
      _clearSearch();
      Navigator.pop(context);
    } else {
      ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
        onRemove: () => setState(() => isSearching = false),
      ));
      setState(() => isSearching = true);
    }
  }

  void _clearSearch() {
    _searchController.clear();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();

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
        } else if (state is SearchedProductsSuccess) {
          products = state.searchedProducts;
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
              leading: const BackButton(
                color: AppColors.whiteColor,
              ),
              title: isSearching
                  ? TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: InputDecoration(
                        hintText: 'Search Products...',
                        hintStyle: AppStyles.styleRegular16(context)
                            .copyWith(color: AppColors.whiteColor),
                        border: InputBorder.none,
                      ),
                      style: AppStyles.styleSimiBold18(context)
                          .copyWith(color: AppColors.whiteColor),
                    )
                  : const Text('Sales',
                      style: TextStyle(color: AppColors.whiteColor)),
              actions: [
                IconButton(
                  onPressed: _toggleSearch,
                  icon: Icon(
                    isSearching ? Icons.clear : Icons.search,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
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
