import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../../core/data/failure/failure.dart';
import '../../../../bag/data/models/product/product.dart';
import '../../../../bag/data/models/product/review.dart';
import '../../../data/repository/rating_and_review_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'rating_and_review_state.dart';

class RatingAndReviewCubit extends Cubit<RatingAndReviewState> {
  RatingAndReviewCubit(this.ratingAndReviewRepo)
      : super(RatingAndReviewInitial());

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
      await ratingAndReviewRepo.addReview(
        productId: productId,
        review: review,
        category: category,
      );
      final updatedProduct = await ratingAndReviewRepo.getProductById(
        endPoint: category,
        productId: productId,
      );
      emit(ProductsDetailUpdated(updatedProduct));
    } catch (e) {
      if (e is DioException) {
        emit(RatingAndReviewFailure(ServerFailure.fromDioException(e).message));
      } else {
        emit(RatingAndReviewFailure('Unexpected error'));
      }
    }
  }
}
