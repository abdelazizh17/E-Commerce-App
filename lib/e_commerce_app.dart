import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/feature/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpView(),
        );
      },
    );
  }
}
