part of 'favorite_products_cubit.dart';

@immutable
sealed class FavoriteProductsState {}

final class FavoriteProductsInitial extends FavoriteProductsState {}

final class FavoritesProductLoading extends FavoriteProductsState {}

final class FavoriteProductAdded extends FavoriteProductsState {}

final class FavoriteProductsLoaded extends FavoriteProductsState {
  final List<Product> products;

  FavoriteProductsLoaded(this.products);
}

final class FavoriteProductFailure extends FavoriteProductsState {
  final String errMessage;

  FavoriteProductFailure(this.errMessage);
}
