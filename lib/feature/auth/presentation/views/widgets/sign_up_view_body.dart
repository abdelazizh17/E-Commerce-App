import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/already_have_an_account_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field_sign_up_section.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
                CustomTextFormFieldSignUpSection(),
                SizedBox(
                  height: 16,
                ),
                AlreadyHaveAnAccountSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
