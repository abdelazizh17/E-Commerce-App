import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_quick_auth_button_section.dart';
import 'package:flutter/material.dart';

class SignUpFooterSection extends StatelessWidget {
  const SignUpFooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 9,
          ),
          Text(
            'Or sign up with social account',
            style: AppStyles.styleMediumBlack14(),
          ),
          SizedBox(
            height: 12,
          ),
          CustomQuickAuthButtonSection(),
          Flexible(
            child: SizedBox(
              height: 26,
            ),
          ),
        ],
      ),
    );
  }
}
