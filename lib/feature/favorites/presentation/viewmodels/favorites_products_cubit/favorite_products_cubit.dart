import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

part 'favorite_products_state.dart';

class FavoriteProductsCubit extends Cubit<FavoriteProductsState> {
  FavoriteProductsCubit() : super(FavoriteProductsInitial());

  List<Product> favoriteProducts = [];

  List<String> _encodeFavorites(List<Product> products) {
    return products.map((product) => jsonEncode(product.toJson())).toList();
  }

  List<Product> _decodeFavorites(List<String> jsonStringList) {
    return jsonStringList
        .map((jsonString) => Product.fromJson(jsonDecode(jsonString)))
        .toList();
  }

  Future<void> _saveFavoritesToSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> productStrings = _encodeFavorites(favoriteProducts);
    await prefs.setStringList('favorite_products', productStrings);
  }

  Future<void> _loadFavoritesFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productStrings = prefs.getStringList('favorite_products');
    if (productStrings != null) {
      favoriteProducts = _decodeFavorites(productStrings);
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
