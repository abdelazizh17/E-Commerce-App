import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/title_screen.dart';
import '../../viewmodels/cubit/auth_cubit.dart';
import 'already_have_an_account_and_forgot_password_section.dart';
import 'custom_button_sign_up_bloc_consumer.dart';
import 'custom_text_form_field_sign_up_section.dart';
import 'package:flutter/material.dart';

class SignUpHeaderSection extends StatefulWidget {
  const SignUpHeaderSection({super.key});

  @override
  State<SignUpHeaderSection> createState() => _SignUpHeaderSectionState();
}

class _SignUpHeaderSectionState extends State<SignUpHeaderSection> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);

    return Form(
      key: formKey,
      child: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            TitleScreen(title: 'SignUp'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 11,
            ),
            CustomTextFormFieldSignUpSection(
              userName: userName,
              email: email,
              password: password,
            ),
            SizedBox(height: 16),
            AlreadyHaveAnAccountAndForgotPasswordSection(
              title: 'Already have an account?',
              onTap: () {
                Navigator.pushNamed(context, Routes.loginView);
              },
            ),
            SizedBox(height: 26),
            CustomButtonSignUpBlocConsumer(
              authCubit: authCubit,
              formKey: formKey,
              userNameController: userName,
              emailController: email,
              passwordController: password,
            ),
          ],
        ),
      ),
    );
  }
}
