import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_quick_auth_button_section.dart';
import 'package:flutter/material.dart';

class LoginFooterSection extends StatelessWidget {
  const LoginFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
            Text(
              'Or login with social account',
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
            )
          ],
        ),
      ),
    );
  }
}
