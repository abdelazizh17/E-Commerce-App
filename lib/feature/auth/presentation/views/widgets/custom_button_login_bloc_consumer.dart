import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_circle_indicator.dart';
import 'package:e_commerce/feature/auth/data/models/login_data.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonLoginBlocConsumer extends StatelessWidget {
  const CustomButtonLoginBlocConsumer({
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
        } else if (state is AuthSuccess) {
          authCubit.isLoading = false;
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeLayout, (route) => false);
        } else if (state is AuthFailure) {
          authCubit.isLoading = false;
          showSnackBar(
              context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return CustomButton(
          widget: authCubit.isLoading
              ? CustomCircleIndicator()
              : Text(
                  'Login',
                  style: AppStyles.styleMediumWhite14()
                      .copyWith(color: AppColors.whiteColor),
                ),
          onPressed: () {
            if (authCubit.formKey.currentState!.validate()) {
              authCubit.login(
                LoginData(
                    email: authCubit.email.text,
                    password: authCubit.password.text),
              );
            }
          },
        );
      },
    );
  }
}
