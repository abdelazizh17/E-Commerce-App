import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../constants.dart';

class SaleProductsWebServices {
  late Dio dio;

  SaleProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: saleAndNewBaseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getSaleProducts() async {
    try {
      var response = await dio.get('products/sale/');
      // print("API Response: ${response.data}");
      return response.data["sale"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
