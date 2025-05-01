import 'package:flutter/material.dart';

import 'sign_up_footer_section.dart';
import 'sign_up_header_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SignUpHeaderSection(),
            SignUpFooterSection(),
          ],
        ),
      ),
    );
  }
}
