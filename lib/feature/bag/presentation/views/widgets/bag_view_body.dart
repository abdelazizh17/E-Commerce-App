import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/bag_products_list.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/bag_view_footer_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagViewBody extends StatefulWidget {
  const BagViewBody({super.key});

  @override
  State<BagViewBody> createState() => _BagViewBodyState();
}

class _BagViewBodyState extends State<BagViewBody> {
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
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkModeBackgroundColor
              : AppColors.primaryColor,
        ),
        const BagProductsList(),
        const BagViewFooterSection(),
      ],
    );
  }
}
