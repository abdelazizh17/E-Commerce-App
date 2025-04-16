import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/home/data/web_services/new_products_web_services.dart';

class NewProductsRepo {
  final NewProductsWebServices newProductsWebServices;

  NewProductsRepo(this.newProductsWebServices);

  Future<List<Product>> getNewProducts() async {
    var product = await newProductsWebServices.getNewProducts();

    return product.map((product) => Product.fromJson(product)).toList();
  }
}
