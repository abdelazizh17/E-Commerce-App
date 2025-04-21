import 'dart:developer';

import 'package:dio/dio.dart';

class CategoryItemWebServices {
  late Dio dio;

  CategoryItemWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://10.0.2.2:8000/",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getCategoryItems() async {
    try {
      var response = await dio.get('category/women');
      return response.data['items'];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
