import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data/failure/failure.dart';
import '../../../../bag/data/models/product/product.dart';
import '../../../data/repository/new_products_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit(this.newProductsRepo) : super(NewProductsInitial());
  final NewProductsRepo newProductsRepo;

  Future<void> getNewProduct() async {
    emit(NewProductsLoading());
    try {
      final products = await newProductsRepo.getNewProducts();
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
