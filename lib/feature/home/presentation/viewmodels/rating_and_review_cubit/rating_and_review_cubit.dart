import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/data/models/product/review.dart';
import 'package:e_commerce/feature/home/data/repository/rating_and_review_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'rating_and_review_state.dart';

class RatingAndReviewCubit extends Cubit<RatingAndReviewState> {
  RatingAndReviewCubit(this.ratingAndReviewRepo) : super(RatingAndReviewInitial());

  final RatingAndReviewRepo ratingAndReviewRepo;

  static RatingAndReviewCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> addReview({
  required String category,
  required int productId,
  required Review review,
}) async {
  emit(RatingAndReviewLoading());
  try {
    final addedReview = await ratingAndReviewRepo.addReview(
      productId: productId,
      review: review,
      category: category,
    );
    emit(RatingAndReviewAdded(review)); // Return the added review
    print('data has been sent');
    return addedReview;
  } catch (e) {
    emit(RatingAndReviewFailure(e.toString()));
    return null;
  }
}

 Future<void> getProductById(int productId) async {
    // emit(RatingAndReviewLoading());
    try {
      final product = await ratingAndReviewRepo.getProductById(productId);
      emit(SaleProductsDetailUpdated(product));
    } catch (e) {
      emit(RatingAndReviewFailure('Failed to fetch product: ${e.toString()}'));
    }
  }
}
