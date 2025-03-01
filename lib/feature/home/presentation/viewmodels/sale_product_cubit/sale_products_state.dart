part of 'sale_products_cubit.dart';

@immutable
sealed class SaleProductsState {}

final class SaleProductsInitial extends SaleProductsState {}
final class SaleProductsLoading extends SaleProductsState {}

final class SaleProductsSuccess extends SaleProductsState {
  final List<Product> products;

  SaleProductsSuccess(this.products);
}

final class SaleProductsFailure extends SaleProductsState {
  final String errMessage;

  SaleProductsFailure(this.errMessage);
}
