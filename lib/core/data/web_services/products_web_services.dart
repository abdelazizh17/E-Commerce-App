import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/constants.dart';

class ProductWebServices {
  late Dio dio;

  ProductWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllProducts() async {
    try {
      var response = await dio.get('products');
      log(response.data.toString());
      return response.data["products"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getSaleProducts() async {
    try {
      var response = await dio.get('c/d622-2fc1-44c9-af68');
      // log(response.data.toString());
      return response.data["sale"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getNewProducts() async {
    try {
      var response = await dio.get('c/d622-2fc1-44c9-af68');
      // log(response.data.toString());
      return response.data["new"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getProductsByCategory(
      {required String category}) async {
    try {
      var response = await dio.get('products/category/$category');
      log(response.data.toString());
      return response.data["products"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
