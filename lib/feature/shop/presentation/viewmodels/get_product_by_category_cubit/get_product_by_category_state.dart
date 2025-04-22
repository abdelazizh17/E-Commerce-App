part of 'get_product_by_category_cubit.dart';

@immutable
sealed class GetProductByCategoryState {}

final class GetProductByCategoryInitial extends GetProductByCategoryState {}

final class GetProductByCategoryLoading extends GetProductByCategoryState {}

final class GetProductByCategorySuccess extends GetProductByCategoryState {
 final List<Product> products;

  GetProductByCategorySuccess(this.products);
}

final class GetProductByCategoryFailure extends GetProductByCategoryState {
  final String errMessage;

  GetProductByCategoryFailure(this.errMessage);
}
