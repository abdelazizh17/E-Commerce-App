import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/data/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.productsRepository) : super(AllProductsInitial());

  final ProductsRepository productsRepository;

  Future<void> getAllProducts() async {
    emit(AllProductsLoading());
    try {
      final products = await productsRepository.getAllProducts();
      emit(AllProductsSuccess(products));
    } catch (e) {
      if (e is DioException) {
        emit(AllProductsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(AllProductsFailure('Unexpected error'));
      }
    }
  }


  Future<void> getProductByCategory({required String category}) async {
    emit(AllProductsLoading());
    try {
      final products =
          await productsRepository.getProductByCategory(category: category);
      emit(AllProductsSuccess(products));
    } catch (e) {
      if (e is DioException) {
        emit(AllProductsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(AllProductsFailure('Unexpected error'));
      }
    }
  }
}
