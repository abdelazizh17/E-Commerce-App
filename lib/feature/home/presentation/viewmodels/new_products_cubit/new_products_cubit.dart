import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/data/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit(this.productsRepository) : super(NewProductsInitial());

  final ProductsRepository productsRepository;

  Future<void> getNewProduct() async {
    emit(NewProductsLoading());
    try {
      final products = await productsRepository.getNewProducts();
      emit(NewProductsSuccess(products));
    } catch (e) {
      if (e is DioException) {
        emit(NewProductsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(NewProductsFailure('Unexpected error'));
      }
    }
  }
}
