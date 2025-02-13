import 'package:e_commerce/feature/auth/presentation/views/widgets/sign_up_footer_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/sign_up_header_section.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SignUpHeaderSection(),
          SignUpFooterSection(),
        ],
      ),
    );
  }
}



