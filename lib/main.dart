import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/utils/api_keys.dart';
import 'core/utils/injection.dart';
import 'core/data/bloc_observer.dart';
import 'core/routes/app_router.dart';
import 'e_commerce_app.dart';
import 'feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'feature/favorites/presentation/viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import 'feature/home/presentation/viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'feature/profile/presentation/viewmodels/cubit/settings_cubit.dart';
import 'feature/shop/presentation/viewmodels/get_product_by_category_cubit/get_product_by_category_cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = ApiKeys.publishableKey;
  getInit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthCubit()..fetchUserData(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => SettingsCubit()..loadTheme(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => getIt<RatingAndReviewCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<GetProductByCategoryCubit>(),
        ),
        BlocProvider(
          create: (_) => FavoriteProductsCubit(),
        ),
        BlocProvider(
          create: (_) => BagCubit(),
        ),
      ],
      child: ECommerceApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
