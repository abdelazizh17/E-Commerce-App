part of 'category_items_cubit.dart';

@immutable
sealed class CategoryItemsState {}

final class CategoryItemsInitial extends CategoryItemsState {}

final class CategoryItemsLoading extends CategoryItemsState {}

final class CategoryItemsSuccess extends CategoryItemsState {
  final List<CategoryItem> categoryItem;

  CategoryItemsSuccess(this.categoryItem);
}

final class CategoryItemsFailure extends CategoryItemsState {
  final String errMessage;

  CategoryItemsFailure(this.errMessage);
}
