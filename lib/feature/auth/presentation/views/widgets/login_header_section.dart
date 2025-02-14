import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/already_have_an_account_and_forgot_password_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button_login_bloc_consumer.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field_login_section.dart';
import 'package:flutter/material.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    return SliverToBoxAdapter(
      child: Form(
        key: authCubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: AppStyles.styleBoldBlack34(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 11,
            ),
            CustomTextFormFieldLoginSection(
              email: authCubit.email,
              password: authCubit.password,
            ),
            SizedBox(
              height: 16,
            ),
            AlreadyHaveAnAccountAndForgotPasswordSection(
              title: 'Forgot your password?',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.forgotPasswordView,
                );
              },
            ),
            SizedBox(
              height: 26,
            ),
            CustomButtonLoginBlocConsumer(authCubit: authCubit),
          ],
        ),
      ),
    );
  }
}
