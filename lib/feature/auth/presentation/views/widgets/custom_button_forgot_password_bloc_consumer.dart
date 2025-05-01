import '../../../../../core/data/helper_methods.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_circle_indicator.dart';
import '../../viewmodels/cubit/auth_cubit.dart';
import 'custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 50.h,
        );
      },
    );
  }
}
