import 'package:e_commerce/feature/bag/data/models/product/product.dart';
import 'package:e_commerce/feature/bag/data/models/product/review.dart';
import 'package:e_commerce/feature/home/data/web_services/rating_and_review_web_services.dart';

class RatingAndReviewRepo {
  final RatingAndReviewWebServices ratingAndReviewWebServices;

  RatingAndReviewRepo(this.ratingAndReviewWebServices);

  Future<void> addReview({
    required String category,
    required int productId,
    required Review review,
  }) async {
    await ratingAndReviewWebServices.addReview(
      category: category,
      review: review,
      productId: productId,
    );
  }

  Future<Product> getProductById(
      {required String endPoint, required int productId}) async {
    var productData = await ratingAndReviewWebServices.getProductById(
      endPoint: endPoint,
      productId: productId,
    );
    return Product.fromJson(productData);
  }
}
