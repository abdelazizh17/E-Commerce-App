import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/shop/data/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'get_product_by_category_state.dart';

class GetProductByCategoryCubit extends Cubit<GetProductByCategoryState> {
  GetProductByCategoryCubit(this.productsRepository) : super(GetProductByCategoryInitial());

    final ProductsRepository productsRepository;

  Future<void> getProductByCategory({required String category}) async {
    emit(GetProductByCategoryLoading());
    try {
      final products =
          await productsRepository.getProductByCategory(category: category);
      emit(GetProductByCategorySuccess(products));
    } catch (e) {
      if (e is DioException) {
        emit(GetProductByCategoryFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(GetProductByCategoryFailure('Unexpected error'));
      }
    }
  }
}
