import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce/constants.dart';

class ProductWebServices {
  late Dio dio;

  ProductWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllProducts({required int pageNumber}) async {
    try {
      var response = await dio.get('products?limit=10&skip=${pageNumber * 10}');
      // log(response.data.toString());
      return response.data["products"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getProductsByCategory(
      {required String category}) async {
    try {
      var response = await dio.get('products/category/$category');
      // log(response.data.toString());
      return response.data["products"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> sortProducts(
      {required String sortBy, required String order,required int pageNumber}) async {
    try {
      var response = await dio.get('products?sortBy=$sortBy&order=$order&limit=10&skip=${pageNumber * 10}');
      // log(response.data.toString());
      return response.data["products"];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
