import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/shop/data/web_services/products_web_services.dart';

class ProductsRepository {
  final ProductWebServices productWebServices;

  ProductsRepository(this.productWebServices);

  Future<List<Product>> getAllProducts({required int pageNumber}) async {
    var product = await productWebServices.getAllProducts(pageNumber: pageNumber);

    return product.map((product) => Product.fromJson(product)).toList();
  }

  Future<List<Product>> getProductByCategory({required String category}) async {
    var product =
        await productWebServices.getProductsByCategory(category: category);

    return product.map((product) => Product.fromJson(product)).toList();
  }
}
