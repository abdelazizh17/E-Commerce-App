import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_theme.dart';
import 'package:e_commerce/feature/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/feature/profile/presentation/viewmodels/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    final settingsCubit = SettingsCubit.get(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            if (state is SettingsThemeUpdated) {
              settingsCubit.themeMode =
                  state.isDarkMode ? ThemeMode.dark : ThemeMode.light;
            } else {
              settingsCubit.themeMode = ThemeMode.light;
            }
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: settingsCubit.themeMode,
              onGenerateRoute: appRouter.generateRoute,
              initialRoute: Routes.signUpView,
              debugShowCheckedModeBanner: false,
              home: SignUpView(),
            );
          },
        );
      },
    );
  }
}
