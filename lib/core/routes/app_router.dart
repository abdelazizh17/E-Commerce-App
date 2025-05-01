import '../../feature/bag/data/models/product/product.dart';
import 'routes.dart';
import '../utils/injection.dart';
import '../../feature/auth/presentation/views/forgot_password_view.dart';
import '../../feature/auth/presentation/views/login_view.dart';
import '../../feature/auth/presentation/views/sign_up_view.dart';
import '../../feature/bag/presentation/views/thank_you_view.dart';
import '../../feature/favorites/presentation/views/favorites_view.dart';
import '../../feature/home/presentation/views/product_details_view.dart';
import '../../feature/home/presentation/views/rating_and_reviews_view.dart';
import '../../feature/home/presentation/views/sales_products_view.dart';
import '../../feature/home_layout/presentation/viewmodels/cubit/home_layout_cubit.dart';
import '../../feature/home_layout/presentation/views/home_layout_view.dart';
import '../../feature/profile/presentation/views/settings_view.dart';
import '../../feature/shop/data/repository/products_repository.dart';
import '../../feature/shop/presentation/viewmodels/get_all_products_cubit/get_all_products_cubit.dart';
import '../../feature/shop/presentation/views/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routes.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeLayoutCubit(),
            child: const HomeLayoutView(),
          ),
        );
      case Routes.favoritesView:
        return MaterialPageRoute(
          builder: (context) => const FavoritesView(),
        );
      case Routes.settingView:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
        );
      case Routes.productDetailsView:
        final args = settings.arguments;
        if (args != null && args is Product) {
          return MaterialPageRoute(
            builder: (context) => ProductDetailsView(product: args),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const Text('error'),
          );
        }
      case Routes.ratingAndReviewsView:
        final args = settings.arguments;
        if (args != null && args is Product) {
          return MaterialPageRoute(
            builder: (context) => RatingAndReviewsView(product: args),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const Text('error'),
          );
        }
      case Routes.productsView:
        final category = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                GetAllProductsCubit(getIt<ProductsRepository>()),
            child: ProductsView(
              category: category,
            ),
          ),
        );
      case Routes.salesProductsView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                GetAllProductsCubit(getIt<ProductsRepository>()),
            child: SalesProductsView(),
          ),
        );
      case Routes.thankYouView:
        return MaterialPageRoute(
          builder: (context) => ThankYouView(),
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
