import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/get_all_products_cubit/get_all_products_cubit.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/sort_menu_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBotttomSheet extends StatelessWidget {
  const FilterBotttomSheet({super.key, required this.cubit});
  final GetAllProductsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 14.sp,
        left: 16.sp,
        right: 16.sp,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: 60.w,
                height: 6,
                decoration: ShapeDecoration(
                  color: AppColors.greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Sort by',
                style: AppStyles.styleSimiBold18(context),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: SortMenuListView(
                  cubit: cubit,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
