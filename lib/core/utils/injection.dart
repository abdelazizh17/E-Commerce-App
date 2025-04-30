import 'package:e_commerce/feature/bag/data/repo/checkout_repo.dart';
import 'package:e_commerce/feature/bag/data/repo/customer_repo.dart';
import 'package:e_commerce/feature/bag/data/services/stripe_service.dart';
import 'package:e_commerce/feature/shop/data/repository/products_repository.dart';
import 'package:e_commerce/feature/shop/data/web_services/products_web_services.dart';
import 'package:e_commerce/feature/home/data/repository/new_products_repo.dart';
import 'package:e_commerce/feature/home/data/repository/rating_and_review_repo.dart';
import 'package:e_commerce/feature/home/data/repository/sale_products_repo.dart';
import 'package:e_commerce/feature/home/data/web_services/new_products_web_services.dart';
import 'package:e_commerce/feature/home/data/web_services/rating_and_review_web_services.dart';
import 'package:e_commerce/feature/home/data/web_services/sale_products_web_services.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/new_products_cubit/new_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/sale_product_cubit/sale_products_cubit.dart';
import 'package:e_commerce/feature/shop/data/repository/category_item_repo.dart';
import 'package:e_commerce/feature/shop/data/web_services/category_item_web_services.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/get_product_by_category_cubit/get_product_by_category_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getInit() {
  // WebServices
  getIt.registerLazySingleton<ProductWebServices>(() => ProductWebServices());
  getIt.registerLazySingleton<NewProductsWebServices>(
    () => NewProductsWebServices(),
  );
  getIt.registerLazySingleton<SaleProductsWebServices>(
    () => SaleProductsWebServices(),
  );
  getIt.registerLazySingleton<RatingAndReviewWebServices>(
    () => RatingAndReviewWebServices(),
  );
  getIt.registerLazySingleton<CategoryItemWebServices>(
    () => CategoryItemWebServices(),
  );
  getIt.registerLazySingleton<StripeService>(() => StripeService());

  // Repositories
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(getIt<ProductWebServices>()),
  );
  getIt.registerLazySingleton<NewProductsRepo>(
    () => NewProductsRepo(getIt<NewProductsWebServices>()),
  );
  getIt.registerLazySingleton<SaleProductsRepo>(
    () => SaleProductsRepo(getIt<SaleProductsWebServices>()),
  );
  getIt.registerLazySingleton<RatingAndReviewRepo>(
    () => RatingAndReviewRepo(getIt<RatingAndReviewWebServices>()),
  );
  getIt.registerLazySingleton<CategoryItemRepo>(
    () => CategoryItemRepo(getIt<CategoryItemWebServices>()),
  );
  getIt.registerLazySingleton<CustomerRepo>(
    () => CustomerRepo(getIt<StripeService>()),
  );

  getIt.registerLazySingleton<CheckoutRepo>(
    () => CheckoutRepo(getIt<StripeService>()),
  );

  // Cubits
  getIt.registerLazySingleton<GetProductByCategoryCubit>(
    () => GetProductByCategoryCubit(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<NewProductsCubit>(
    () => NewProductsCubit(getIt<NewProductsRepo>()),
  );
  getIt.registerLazySingleton<SaleProductsCubit>(
    () => SaleProductsCubit(getIt<SaleProductsRepo>()),
  );
  getIt.registerLazySingleton<RatingAndReviewCubit>(
    () => RatingAndReviewCubit(getIt<RatingAndReviewRepo>()),
  );
}
