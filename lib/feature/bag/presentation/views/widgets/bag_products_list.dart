import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../viewmodels/bag_cubit/bag_cubit.dart';
import 'product_bag_card_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BagProductsList extends StatelessWidget {
  const BagProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        if (state is BagProductLoaded) {
          final products = state.products;
          return (products.isEmpty)
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      'No items in your bag',
                      style: AppStyles.styleRegular16(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : ProductBagCardSliverList(products: products);
        } else if (state is BagProductFailure) {
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
