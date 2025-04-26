import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/shop/data/web_services/products_web_services.dart';

class ProductsRepository {
  final ProductWebServices productWebServices;

  ProductsRepository(this.productWebServices);

  Future<List<Product>> searchProducts(String searchText) async {
  var products = await productWebServices.searchProducts(searchText);
  return products.map((product) => Product.fromJson(product)).toList();
}

  Future<List<Product>> fetchProductsPage({required int pageNumber}) async {
    var products =
        await productWebServices.fetchProductsPage(pageNumber: pageNumber);

    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getProductByCategory({required String category}) async {
    var products =
        await productWebServices.getProductsByCategory(category: category);

    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> sortProducts(
      {required String sortBy,
      required String order,
      required int pageNumber}) async {
    var products = await productWebServices.sortProducts(
        order: order, sortBy: sortBy, pageNumber: pageNumber);

    return products.map((product) => Product.fromJson(product)).toList();
  }
}
