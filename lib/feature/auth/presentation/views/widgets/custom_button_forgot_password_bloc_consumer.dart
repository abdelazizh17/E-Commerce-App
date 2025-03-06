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
    required this.formKey,
  });

  final AuthCubit authCubit;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetRequestSent) {
          showSnackBar(
              context,
              '"We\'ve sent you a link to reset your password\nPlease check email"',
              AppColors.greenColor);
        } else if (state is AuthError) {
          showSnackBar(context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: state is AuthLoading
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    authCubit.resetPassword(authCubit.emailController.text);
                  }
                },
          widget: state is AuthLoading
              ? CustomCircleIndicator()
              : Text(
                  'Send',
                  style: AppStyles.styleMedium14(),
                ),
        );
      },
    );
  }
}
