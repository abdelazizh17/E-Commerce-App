import 'package:e_commerce/core/data/bloc_observer.dart';
import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/e_commerce_app.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/home_layout/presentation/viewmodels/cubit/home_layout_cubit.dart';
import 'package:e_commerce/feature/profile/presentation/viewmodels/cubit/settings_cubit.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(),
        ),
        BlocProvider(
          create: (_) => HomeLayoutCubit(),
        ),
        BlocProvider(
          create: (_) => SettingsCubit()..loadTheme(),
        ),
      ],
      child: ECommerceApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
