import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/data/models/product/review.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_circle_indicator.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/write_review_bottom_sheet.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitReviewButton extends StatelessWidget {
  const SubmitReviewButton({
    super.key,
    required this.ratingAndReviewCubit,
    required this.widget,
    required this.reviewController,
    required this.formKey,
    required this.rating,
  });

  final RatingAndReviewCubit ratingAndReviewCubit;
  final WriteReviewBottomSheet widget;
  final TextEditingController reviewController;
  final GlobalKey<FormState> formKey;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingAndReviewCubit, RatingAndReviewState>(
      bloc: ratingAndReviewCubit,
      listener: (context, state) {
        if (state is RatingAndReviewAdded) {
          ratingAndReviewCubit.getProductById(widget.product.id!);
          Navigator.pop(context);
          reviewController.clear();
        } else if (state is RatingAndReviewFailure) {
          showSnackBar(
            context,
            state.errMessage,
            AppColors.primaryColor,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: state is RatingAndReviewLoading
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    ratingAndReviewCubit.addReview(
                      category: 'sale',
                      productId: widget.product.id!,
                      review: Review(
                        rating: rating.toInt(),
                        comment: reviewController.text,
                        reviewerName: 'Abdelaziz', //for test
                      ),
                    );
                  }
                },
          widget: state is RatingAndReviewLoading
              ? const CustomCircleIndicator()
              : Text(
                  'Send Review',
                  style: AppStyles.styleMedium14(),
                ),
          height: 50.h,
        );
      },
    );
  }
}
