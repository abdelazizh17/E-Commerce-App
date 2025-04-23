import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/shop/data/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this.productsRepository) : super(GetAllProductsInitial());

  final ProductsRepository productsRepository;
  List<Product> loadedProducts = [];
  int currentPage = 0;
  bool isLoading = false;

  Future<void> getAllProducts({bool loadMore = false}) async {
    if (isLoading) return;
    
    isLoading = true;

    if (!loadMore) {
      loadedProducts.clear();
      currentPage = 0;
    }
    emit(GetAllProductsLoading());
    try {
      final products =
          await productsRepository.getAllProducts(pageNumber: currentPage);
      loadedProducts.addAll(products);
      currentPage++;
      emit(GetAllProductsSuccess(loadedProducts));
    } catch (e) {
      if (e is DioException) {
        emit(GetAllProductsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(GetAllProductsFailure('Unexpected error'));
      }
    } finally {
      isLoading = false;
    }
  }
}
