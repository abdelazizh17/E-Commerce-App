import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/widgets/title_screen.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/already_have_an_account_and_forgot_password_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button_sign_up_bloc_consumer.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field_sign_up_section.dart';
import 'package:flutter/material.dart';

class SignUpHeaderSection extends StatelessWidget {
  const SignUpHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    final formKey = GlobalKey<FormState>();
    final TextEditingController userName = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Form(
      key: formKey,
      child: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            TitleScreen(
              title: 'SignUp',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 11,
            ),
            CustomTextFormFieldSignUpSection(
              userName: userName,
              email: email,
              password: password,
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
            CustomButtonSignUpBlocConsumer(
              authCubit: authCubit,
              formKey: formKey, userNameController: userName, emailController: email, passwordController: password,
            ),
          ],
        ),
      ),
    );
  }
}
