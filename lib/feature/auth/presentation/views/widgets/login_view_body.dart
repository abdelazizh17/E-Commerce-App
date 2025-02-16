import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/login_footer_section.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/login_header_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        LoginHeaderSection(),
        LoginFooterSection(),
      ],
    );
  }
}

