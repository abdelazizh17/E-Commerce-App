import 'dart:developer';

import 'package:dio/dio.dart';

class NewProductsWebServices {
  late Dio dio;
  NewProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://10.0.2.2:8000/",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getNewProducts() async {
    try {
      var response = await dio.get('products/new/');
      // log(response.data.toString());
      return response.data["new"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
