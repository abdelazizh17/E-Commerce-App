import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagViewFooterSection extends StatelessWidget {
  const BagViewFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        if (state is BagProductLoaded) {
          final cubit = context.read<BagCubit>();
          final total = cubit.bagProducts.fold<double>(
            0,
            (sum, item) => sum + (item.price! * item.quantity),
          );

          return SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total amount : ',
                        style: AppStyles.styleRegularGrey14(),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: AppStyles.styleSimiBold18(context),
                      ),
                    ],
                  ),
                  CustomButton(
                    padding: const EdgeInsets.only(bottom: 16, top: 24),
                    onPressed: () {},
                    widget: Text(
                      'CHECK OUT',
                      style: AppStyles.styleMedium14(),
                    ),
                    height: 50.h,
                  ),
                ],
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
