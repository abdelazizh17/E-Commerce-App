part of 'rating_and_review_cubit.dart';

@immutable
sealed class RatingAndReviewState {}

final class RatingAndReviewInitial extends RatingAndReviewState {}

final class RatingAndReviewLoading extends RatingAndReviewState {}

final class RatingAndReviewFailure extends RatingAndReviewState {
  final String errMessage;

  RatingAndReviewFailure(this.errMessage);
}

class ProductsDetailUpdated extends RatingAndReviewState {
  final Product product;
  ProductsDetailUpdated(this.product);
}
