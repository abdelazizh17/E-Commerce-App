import 'package:e_commerce/feature/auth/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: ForgotPasswordViewBody());
  }
}
