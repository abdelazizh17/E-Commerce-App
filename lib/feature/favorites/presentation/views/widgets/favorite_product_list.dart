import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_styles.dart' show AppStyles;
import '../../viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import '../../../../shop/presentation/views/widgets/products_sliver_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class FavoriteProductsList extends StatelessWidget {
  const FavoriteProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
      builder: (context, state) {
        if (state is FavoriteProductsLoaded) {
          final products = state.products;
          return (products.isEmpty)
              ? SliverFillRemaining(
                  hasScrollBody: false,
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
            hasScrollBody: false,
            child: Center(
              child: Text('Error : ${state.errMessage}'),
            ),
          );
        } else {
          return SliverFillRemaining(
            hasScrollBody: false,
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
    );
  }
}
