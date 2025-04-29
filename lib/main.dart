import 'package:e_commerce/core/utils/injection.dart';
import 'package:e_commerce/core/data/bloc_observer.dart';
import 'package:e_commerce/core/routes/app_router.dart';
import 'package:e_commerce/e_commerce_app.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'package:e_commerce/feature/favorites/presentation/viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'package:e_commerce/feature/profile/presentation/viewmodels/cubit/settings_cubit.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/get_product_by_category_cubit/get_product_by_category_cubit.dart';
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
        )
      ],
      child: ECommerceApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
