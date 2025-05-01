import '../../../../../core/data/helper_methods.dart';
import '../../../../bag/data/models/product/product.dart';
import '../../../../bag/data/models/product/review.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_circle_indicator.dart';
import '../../../../auth/presentation/views/widgets/custom_button.dart';
import '../../viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmitReviewButton extends StatelessWidget {
  const SubmitReviewButton({
    super.key,
    required this.ratingAndReviewCubit,
    required this.reviewController,
    required this.formKey,
    required this.rating,
    required this.product,
    required this.scrollController,
  });

  final RatingAndReviewCubit ratingAndReviewCubit;
  final TextEditingController reviewController;
  final GlobalKey<FormState> formKey;
  final double rating;
  final Product product;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingAndReviewCubit, RatingAndReviewState>(
      bloc: ratingAndReviewCubit,
      listener: (context, state) {
        if (state is ProductsDetailUpdated) {
          Navigator.pop(context);
          reviewController.clear();
          _buildScrollController();
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
                      category: product.endPoint ?? 'new',
                      productId: product.id!,
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

  void _buildScrollController() {
    return WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!scrollController.hasClients) return;

      await scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linearToEaseOut,
      );

      if (!scrollController.hasClients) return;

      if (scrollController.offset < scrollController.position.maxScrollExtent) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }
}
