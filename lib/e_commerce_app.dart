import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/feature/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpView(),
    );
  }
}
