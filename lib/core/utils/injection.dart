import 'package:e_commerce/core/cubits/all_products_cubit/all_products_cubit.dart';
import 'package:e_commerce/core/data/repository/products_repository.dart';
import 'package:e_commerce/core/data/web_services/products_web_services.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/new_products_cubit/new_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/sale_product_cubit/sale_products_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getInit() {
  getIt.registerLazySingleton<ProductWebServices>(
      () => ProductWebServices());
  getIt.registerLazySingleton<ProductsRepository>(() => ProductsRepository(getIt<ProductWebServices>()));
  getIt.registerLazySingleton<AllProductsCubit>(() => AllProductsCubit(getIt<ProductsRepository>()));
  getIt.registerLazySingleton<NewProductsCubit>(() => NewProductsCubit(getIt<ProductsRepository>()));
  getIt.registerLazySingleton<SaleProductsCubit>(() => SaleProductsCubit(getIt<ProductsRepository>()));
}
