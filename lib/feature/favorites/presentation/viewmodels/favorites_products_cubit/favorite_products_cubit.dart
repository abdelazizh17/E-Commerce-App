import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteProductsInitial());

  List<Product> favoriteProducts = [];

  Future<void> _saveFavoritesToSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> productStrings = encodeProducts(favoriteProducts);
    await prefs.setStringList('favorite_products', productStrings);
  }

  Future<void> _loadFavoritesFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productStrings = prefs.getStringList('favorite_products');
    if (productStrings != null) {
      favoriteProducts = decodeProducts(productStrings);
    }
  }

  Future<void> addFavoriteProduct(Product product) async {
    emit(FavoritesProductLoading());
    try {
      if (!favoriteProducts.any((p) => p.id == product.id)) {
        favoriteProducts.add(product);
        await _saveFavoritesToSharedPrefs();
      }
      emit(FavoriteProductAdded());
    } on Exception catch (e) {
      emit(FavoriteProductFailure(e.toString()));
    }
  }

  Future<void> removeFavoriteProduct(Product product) async {
    emit(FavoritesProductLoading());
    try {
      favoriteProducts.removeWhere((p) => p.id == product.id);
      await _saveFavoritesToSharedPrefs();
      emit(FavoriteProductsLoaded(favoriteProducts));
    } on Exception catch (e) {
      emit(FavoriteProductFailure(e.toString()));
    }
  }

  Future<void> fetchFavoriteProducts() async {
    try {
      await _loadFavoritesFromSharedPrefs();
      emit(FavoriteProductsLoaded(favoriteProducts));
    } on Exception catch (e) {
      emit(FavoriteProductFailure(e.toString()));
    }
  }

  bool isProductFavorite(Product product) {
    return favoriteProducts.any((p) => p.id == product.id);
  }
}
