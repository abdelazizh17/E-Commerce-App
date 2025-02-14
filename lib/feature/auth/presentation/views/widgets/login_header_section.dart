import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/already_have_an_account_and_forgot_password_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field_login_section.dart';
import 'package:flutter/material.dart';

class LoginHeaderSection extends StatelessWidget {
  const LoginHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
          CustomTextFormFieldLoginSection(),
          SizedBox(
            height: 16,
          ),
          AlreadyHaveAnAccountAndForgotPasswordSection(
            title: 'Forgot your password?',
            onTap: () {},
          ),
          SizedBox(
            height: 26,
          ),
          CustomButton(
            widget: Text(
              'Login',
              style: AppStyles.styleMediumWhite14()
                  .copyWith(color: AppColors.whiteColor),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
