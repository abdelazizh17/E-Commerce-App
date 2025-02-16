import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/forgot_password_view.dart';
import 'package:e_commerce/feature/auth/presentation/views/login_view.dart';
import 'package:e_commerce/feature/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/feature/bag/presentation/views/bag_view.dart';
import 'package:e_commerce/feature/favorites/presentation/views/favorites_view.dart';
import 'package:e_commerce/feature/home/presentation/views/home_view.dart';
import 'package:e_commerce/feature/home_layout/presentation/viewmodels/cubit/home_layout_cubit.dart';
import 'package:e_commerce/feature/home_layout/presentation/views/home_layout_view.dart';
import 'package:e_commerce/feature/profile/presentation/views/profile_view.dart';
import 'package:e_commerce/feature/shop/presentation/views/shop_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          ),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          ),
        );
      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgotPasswordView(),
          ),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeLayoutCubit(),
            child: const HomeLayoutView(),
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.shopView:
        return MaterialPageRoute(
          builder: (context) => const ShopView(),
        );
      case Routes.bagView:
        return MaterialPageRoute(
          builder: (context) => const BagView(),
        );
      case Routes.favoritesView:
        return MaterialPageRoute(
          builder: (context) => const FavoritesView(),
        );
      case Routes.profileView:
        return MaterialPageRoute(
          builder: (context) => const ProfileView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No Route Defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
