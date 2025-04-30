import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/utils/injection.dart';
import 'package:e_commerce/feature/bag/data/repo/checkout_repo.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/payment_cubit/payment_cubit.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/bag_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                   BlocProvider(
                    create: (context) => PaymentCubit(getIt<CheckoutRepo>()),
                    child: BagCheckoutButton(total: total),
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

