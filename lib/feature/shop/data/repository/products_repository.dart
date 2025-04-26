import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/shop/data/web_services/products_web_services.dart';

class ProductsRepository {
  final ProductWebServices productWebServices;

  ProductsRepository(this.productWebServices);

  Future<List<Product>> getAllProducts({required int pageNumber}) async {
    var products =
        await productWebServices.getAllProducts(pageNumber: pageNumber);

    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getProductByCategory({required String category}) async {
    var products =
        await productWebServices.getProductsByCategory(category: category);

    return products.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> sortProducts({required String sortBy ,required String order,required int pageNumber}) async {
    var products = await productWebServices.sortProducts(order: order, sortBy: sortBy, pageNumber: pageNumber);

    return products.map((product) => Product.fromJson(product)).toList();
  }
}
