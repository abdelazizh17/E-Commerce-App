import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/data/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'sale_products_state.dart';

class SaleProductsCubit extends Cubit<SaleProductsState> {
  SaleProductsCubit(this.productsRepository) : super(SaleProductsInitial());
  final ProductsRepository productsRepository;

  Future<void> getSaleProducts() async {
    if (isClosed) return;
    emit(SaleProductsLoading());
    try {
      final products = await productsRepository.getSaleProducts();
      emit(SaleProductsSuccess(products));
    } catch (e) {
      if (e is DioException) {
        emit(SaleProductsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(SaleProductsFailure('Unexpected error'));
      }
    }
  }
}
