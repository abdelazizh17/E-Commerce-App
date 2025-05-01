import 'dart:developer';

import 'package:dio/dio.dart';
import '../../../../constants.dart';
import '../../../bag/data/models/product/review.dart';

class RatingAndReviewWebServices {
  late Dio dio;

  RatingAndReviewWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: saleAndNewBaseUrl,
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

  Future<dynamic> getProductById(
      {required String endPoint, required int productId}) async {
    try {
      var response = await dio.get(
        'products/$endPoint/$productId',
      );
      // log("Product response: ${response.data}");
      return response.data;
    } on Exception catch (e) {
      log("Error fetching product: ${e.toString()}");
      rethrow;
    }
  }
}
