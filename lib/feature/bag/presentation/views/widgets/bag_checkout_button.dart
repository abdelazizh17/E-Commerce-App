import '../../../../../core/data/helper_methods.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../auth/presentation/viewmodels/cubit/auth_cubit.dart';
import '../../../../auth/presentation/views/widgets/custom_button.dart';
import '../../../data/models/payment_intent_model/payment_intent_input_model.dart';
import '../../viewmodels/payment_cubit/payment_cubit.dart';
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
