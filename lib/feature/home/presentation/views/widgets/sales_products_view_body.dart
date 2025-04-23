import 'package:e_commerce/core/data/helper_methods.dart';
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

  @override
  void initState() {
    _loadData();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  void _loadData() {
    final productCubit = context.read<GetAllProductsCubit>();
    productCubit.getAllProducts();
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      context
          .read<GetAllProductsCubit>()
          .getAllProducts(loadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<GetAllProductsCubit>();

    return BlocConsumer<GetAllProductsCubit, GetAllProductsState>(
      listener: (context, state) {
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
                ? SliverFillRemaining(
                    child: CustomSkeletonizerProductCardGridView(),
                  )
                : ProductsSliverGrid(products: productCubit.loadedProducts),
          ],
        );
      },
    );
  }
}
