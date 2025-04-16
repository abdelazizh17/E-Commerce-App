import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/data/models/product/review.dart';

class RatingAndReviewWebServices {
  late Dio dio;

  RatingAndReviewWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://10.0.2.2:8000/",
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
      },
    );

    dio = Dio(options);
  }

  Future<void> addReview({
    required String category,
    required Review review,
    required int productId,
  }) async {
    try {
        await dio.post(
        'products/$category/$productId/reviews',
        data: review.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }

    Future<dynamic> getProductById(int productId) async {
    try {
      var response = await dio.get('products/sale/$productId');
      // log("Product response: ${response.data}");
      return response.data;
    } on Exception catch (e) {
      log("Error fetching product: ${e.toString()}");
      rethrow;
    }
  }
}
