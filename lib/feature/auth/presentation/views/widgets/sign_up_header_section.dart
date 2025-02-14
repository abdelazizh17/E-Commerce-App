import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/already_have_an_account_and_forgot_password_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field_sign_up_section.dart';
import 'package:flutter/material.dart';

class SignUpHeaderSection extends StatelessWidget {
  const SignUpHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);

    return Form(
      key: authCubit.formKey,
      child: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SignUp',
              style: AppStyles.styleBoldBlack34(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 11,
            ),
            CustomTextFormFieldSignUpSection(
              userName: authCubit.userName,
              email: authCubit.email,
              password: authCubit.password,
            ),
            SizedBox(
              height: 16,
            ),
            AlreadyHaveAnAccountAndForgotPasswordSection(
              title: 'Already have an account?',
              onTap: () {
                Navigator.pushNamed(context, Routes.loginView);
              },
            ),
            SizedBox(
              height: 26,
            ),
            CustomButtonBlocConsumer(authCubit: authCubit),
          ],
        ),
      ),
    );
  }
}
