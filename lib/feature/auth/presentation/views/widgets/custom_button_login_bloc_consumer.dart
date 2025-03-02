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
    required this.formKey,
  });

  final AuthCubit authCubit;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUserDataLoaded) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homeLayout, (route) => false);
          authCubit.email.clear();
          authCubit.password.clear();
        } else if (state is AuthError) {
          showSnackBar(context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        return CustomButton(
          widget: state is AuthLoading
              ? CustomCircleIndicator()
              : Text(
                  'Login',
                  style: AppStyles.styleMedium14(),
                ),
          onPressed: state is AuthLoading
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
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
