part of 'new_products_cubit.dart';

@immutable
sealed class NewProductsState {}

final class NewProductsInitial extends NewProductsState {}

final class NewProductsLoading extends NewProductsState {}

final class NewProductsSuccess extends NewProductsState {
  final List<Product> products;

  NewProductsSuccess(this.products);
}

final class NewProductsFailure extends NewProductsState {
  final String errMessage;

  NewProductsFailure(this.errMessage);

}
