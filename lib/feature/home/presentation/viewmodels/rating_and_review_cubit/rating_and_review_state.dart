part of 'rating_and_review_cubit.dart';

@immutable
sealed class RatingAndReviewState {}

final class RatingAndReviewInitial extends RatingAndReviewState {}

final class RatingAndReviewLoading extends RatingAndReviewState {}

final class RatingAndReviewFailure extends RatingAndReviewState {
  final String errMessage;

  RatingAndReviewFailure(this.errMessage);
}

class RatingAndReviewAdded extends RatingAndReviewState {
  final Review addedReview;
  
  RatingAndReviewAdded(this.addedReview);
}
class SaleProductsDetailUpdated extends RatingAndReviewState {
  final Product product;
  SaleProductsDetailUpdated(this.product);
}