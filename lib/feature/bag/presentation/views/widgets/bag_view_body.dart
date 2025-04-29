import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/bag_view_footer_section.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/product_bag_card_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BagViewBody extends StatefulWidget {
  const BagViewBody({super.key});

  @override
  State<BagViewBody> createState() => _BagViewBodyState();
}

class _BagViewBodyState extends State<BagViewBody> {
  late List<Product> products = [];
  @override
  void initState() {
    context.read<BagCubit>().fetchBagProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          title: Text(
            'My Bag',
            style: AppStyles.styleSimiBold18(context).copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        BlocBuilder<BagCubit, BagState>(
          builder: (context, state) {
            if (state is BagProductLoaded) {
              products = state.products;
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
        ),
        BagViewFooterSection()
      ],
    );
  }
}

