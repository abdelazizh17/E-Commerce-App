import 'package:e_commerce/feature/auth/presentation/views/widgets/login_footer_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/login_header_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          LoginHeaderSection(),
          LoginFooterSection(),
        ],
      ),
    );
  }
}
