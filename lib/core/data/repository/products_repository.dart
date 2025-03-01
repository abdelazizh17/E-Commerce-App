import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/data/web_services/products_web_services.dart';

class ProductsRepository {
  final ProductWebServices productWebServices;

  ProductsRepository(this.productWebServices);

  Future<List<Product>> getAllProducts() async {
    var product = await productWebServices.getAllProducts();

    return product.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getSaleProducts() async {
    var product = await productWebServices.getSaleProducts();

    return product.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getNewProducts() async {
    var product = await productWebServices.getNewProducts();

    return product.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getProductByCategory({required String category}) async {
    var product =
        await productWebServices.getProductsByCategory(category: category);

    return product.map((product) => Product.fromJson(product)).toList();
  }
}
