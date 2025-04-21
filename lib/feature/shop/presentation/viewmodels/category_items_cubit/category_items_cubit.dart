import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/failure/failure.dart';
import 'package:e_commerce/feature/shop/data/models/category_item.dart';
import 'package:e_commerce/feature/shop/data/repository/category_item_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_items_state.dart';

class CategoryItemsCubit extends Cubit<CategoryItemsState> {
  CategoryItemsCubit(this.categoryItemRepo) : super(CategoryItemsInitial());

  final CategoryItemRepo categoryItemRepo;
  static CategoryItemsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> getCategoryItems() async {
    emit(CategoryItemsLoading());
    try {
      final categoryItems = await categoryItemRepo.getCategoryItems();
      emit(CategoryItemsSuccess(categoryItems));
    } on Exception catch (e) {
      if (e is DioException) {
        emit(CategoryItemsFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(CategoryItemsFailure('Unexpected error'));
      }
    }
  }
}
