import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data/failure/failure.dart';
import '../../../../bag/data/models/product/product.dart';
import '../../../data/repository/products_repository.dart';
import 'package:meta/meta.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this.productsRepository) : super(GetAllProductsInitial());

  final ProductsRepository productsRepository;

  List<Product> allProducts = [];
  int allProductsPage = 0;
  bool isLoadingAll = false;

  List<Product> sortedProducts = [];
  int sortedProductsPage = 0;
  bool isLoadingSorted = false;

  String? currentSortBy;
  String? currentOrder;

  Future<void> fetchProductsPage({bool loadMore = false}) async {
    if (isLoadingAll) return;
    isLoadingAll = true;

    if (!loadMore) {
      allProducts.clear();
      allProductsPage = 0;
      emit(GetAllProductsLoading());
    }

    try {
      final products = await productsRepository.fetchProductsPage(
          pageNumber: allProductsPage);
      allProducts.addAll(products);
      allProductsPage++;
      emit(GetAllProductsSuccess(allProducts));
    } catch (e) {
      if (e is DioException) {
        emit(GetAllProductsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(GetAllProductsFailure('Unexpected error'));
      }
    } finally {
      isLoadingAll = false;
    }
  }

  Future<void> sortProducts({
    required String sortBy,
    required String order,
    bool loadMore = false,
  }) async {
    if (isLoadingSorted) return;
    isLoadingSorted = true;

    if (!loadMore) {
      sortedProducts.clear();
      sortedProductsPage = 0;
      currentSortBy = sortBy;
      currentOrder = order;
      emit(GetAllProductsLoading());
    }

    try {
      final products = await productsRepository.sortProducts(
          order: order, sortBy: sortBy, pageNumber: sortedProductsPage);

      sortedProducts.addAll(products);
      sortedProductsPage++;
      emit(SortedProductsSuccess(sortedProducts));
    } catch (e) {
      if (e is DioException) {
        emit(GetAllProductsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(GetAllProductsFailure('Unexpected error'));
      }
    } finally {
      isLoadingSorted = false;
    }
  }

  void searchProducts(String searchText) async {
    emit(GetAllProductsLoading());
    try {
      final searchedProducts =
          await productsRepository.searchProducts(searchText);
      emit(SearchedProductsSuccess(searchedProducts));
    } catch (e) {
      emit(GetAllProductsFailure('Failed to search products'));
    }
  }

  int currentIndex = 0;
  String selectedFromSort = 'Popular';
  void changeTap(int index, String selected) {
    if (currentIndex != index && selectedFromSort != selected) {
      currentIndex = index;
      selectedFromSort = selected;
      emit(SortOptionChanged());
    }
  }
}
