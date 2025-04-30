import 'package:e_commerce/feature/bag/data/models/product/product.dart';
import 'package:e_commerce/feature/home/data/web_services/sale_products_web_services.dart';

class SaleProductsRepo {
  final SaleProductsWebServices saleProductsWebServices;

  SaleProductsRepo(this.saleProductsWebServices);

  Future<List<Product>> getSaleProducts() async {
    var product = await saleProductsWebServices.getSaleProducts();

    return product.map((product) => Product.fromJson(product)).toList();
  }
}
