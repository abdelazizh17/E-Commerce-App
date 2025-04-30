import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/bag/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagCheckoutButton extends StatelessWidget {
  const BagCheckoutButton({
    super.key,
    required this.total,
  });

  final double total;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacementNamed(Routes.thankYouView);
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop;
          showSnackBar(context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return CustomButton(
          padding: const EdgeInsets.only(bottom: 16, top: 24),
          onPressed: () {
            final user = context.read<AuthCubit>().state;
            if (user is AuthUserDataLoaded) {
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                amount: (total * 100).toInt(),
                currency: 'USD',
                customerId: user.userModel
                    .stripeCustomerId!, // Use the stored Stripe customer ID
              );
              context.read<PaymentCubit>().makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            } else {
              showSnackBar(context, 'Please sign in to checkout',
                  AppColors.primaryColor);
            }
          },
          widget: Text(
            'CHECK OUT',
            style: AppStyles.styleMedium14(),
          ),
          height: 50.h,
        );
      },
    );
  }
}
