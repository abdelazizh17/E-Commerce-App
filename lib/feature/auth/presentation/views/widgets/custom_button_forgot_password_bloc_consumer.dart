import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_circle_indicator.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonForgotPasswordBlocConsumer extends StatelessWidget {
  const CustomButtonForgotPasswordBlocConsumer({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          authCubit.isLoading = true;
        } else if (state is PasswordResetRequestSent) {
          authCubit.isLoading = false;
          showSnackBar(
              context,
              '"We\'ve sent you a link to reset your password\nPlease check email"',
              AppColors.greenColor);
        } else if (state is AuthFailure) {
          authCubit.isLoading = false;
          showSnackBar(context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (authCubit.formKey.currentState!.validate()) {
              authCubit.resetPassword(authCubit.email.text);
            }
          },
          widget: authCubit.isLoading
              ? CustomCircleIndicator()
              : Text(
                  'Send',
                  style: AppStyles.styleMediumWhite14(),
                ),
        );
      },
    );
  }
}
