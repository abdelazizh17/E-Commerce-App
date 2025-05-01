import 'dart:developer';

import 'package:dio/dio.dart';

class CategoryItemWebServices {
  late Dio dio;

  CategoryItemWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://e-commerce-api-production-297e.up.railway.app/",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getCategoryItems(String category) async {
    try {
      var response = await dio.get('category/$category');
      return response.data['items'];
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
