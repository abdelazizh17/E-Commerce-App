import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/favorites/presentation/viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/products_sliver_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FavoritesViewBody extends StatefulWidget {
  const FavoritesViewBody({super.key});

  @override
  State<FavoritesViewBody> createState() => _FavoritesViewBodyState();
}

class _FavoritesViewBodyState extends State<FavoritesViewBody> {
  List<Product> products = [];

  @override
  void initState() {
    context.read<FavoriteProductsCubit>().fetchFavoriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          title: Text(
            'Favorites',
            style: AppStyles.styleSimiBold18(context).copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
          builder: (context, state) {
            if (state is FavoriteProductsLoaded) {
              products = state.products;
              return (products.isEmpty)
                  ? SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'Your favorites list is empty. Start adding products you love!',
                          style: AppStyles.styleRegular16(context),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ProductsSliverGrid(
                      products: products.toList(),
                    );
            } else if (state is FavoriteProductFailure) {
              return SliverFillRemaining(
                child: Center(
                  child: Text('Error : ${state.errMessage}'),
                ),
              );
            } else {
              return SliverFillRemaining(
                child: Center(
                  child: LottieBuilder.asset(
                    Assets.imagesLoading,
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
