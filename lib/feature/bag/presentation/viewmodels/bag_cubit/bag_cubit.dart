import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bag_state.dart';

class BagCubit extends Cubit<BagState> {
  BagCubit() : super(BagInitial());

  List<Product> bagProducts = [];

  Future<void> _saveBagProductsToSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> productsString = encodeProducts(bagProducts);
    await prefs.setStringList('bag_products', productsString);
  }

  Future<void> _loadBagProductFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productsString = prefs.getStringList('bag_products');
    if (productsString != null) {
      bagProducts = decodeProducts(productsString);
    }
  }

  Future<void> addBagProduct(Product product) async {
    emit(BagLoading());
    try {
      if (!bagProducts.any((p) => p.id == product.id)) {
        bagProducts.add(product);
        await _saveBagProductsToSharedPrefs();
      }
      emit(BagProductAdded());
    } on Exception catch (e) {
      emit(BagProductFailure(e.toString()));
    }
  }

  Future<void> removeBagProduct(Product product) async {
    try {
      bagProducts.removeWhere((p) => p.id == product.id);
      await _saveBagProductsToSharedPrefs();
      emit(BagProductLoaded(bagProducts));
    } on Exception catch (e) {
      emit(BagProductFailure(e.toString()));
    }
  }

  Future<void> fetchBagProducts() async {
    try {
      await _loadBagProductFromSharedPrefs();
      emit(BagProductLoaded(bagProducts));
    } on Exception catch (e) {
      emit(BagProductFailure(e.toString()));
    }
  }

  Future<void> updateProductQuantity(Product product) async {
    try {
      final index = bagProducts.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        bagProducts[index] = product;
        await _saveBagProductsToSharedPrefs();
      }
      emit(BagProductLoaded(bagProducts));
    } on Exception catch (e) {
      emit(BagProductFailure(e.toString()));
    }
  }

  bool isProductInbag(Product product) {
    return bagProducts.any((p) => p.id == product.id);
  }
}
