import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data/failure/failure.dart';
import '../../../../bag/data/models/product/product.dart';
import '../../../data/repository/sale_products_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sale_products_state.dart';

class SaleProductsCubit extends Cubit<SaleProductsState> {
  SaleProductsCubit(this.saleProductsRepo) : super(SaleProductsInitial());
  final SaleProductsRepo saleProductsRepo;

  static SaleProductsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getSaleProducts() async {
    emit(SaleProductsLoading());
    try {
      final products = await saleProductsRepo.getSaleProducts();
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
