import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/feature/bag/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/submit_review_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteReviewBottomSheet extends StatefulWidget {
  const WriteReviewBottomSheet({
    super.key,
    required this.product,
    required this.mediaQuery,
    required this.ratingAndReviewCubit,
    required this.scrollController,
  });

  final MediaQueryData mediaQuery;
  final Product product;
  final RatingAndReviewCubit ratingAndReviewCubit;
  final ScrollController scrollController;

  @override
  State<WriteReviewBottomSheet> createState() => _WriteReviewBottomSheetState();
}

class _WriteReviewBottomSheetState extends State<WriteReviewBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController reviewController = TextEditingController();
  double rating = 0;

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ratingAndReviewCubit = widget.ratingAndReviewCubit;
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.only(
          top: 14.sp,
          left: 16.sp,
          right: 16.sp,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        width: widget.mediaQuery.size.width,
        height: widget.mediaQuery.size.height * 0.7,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 60.w,
                height: 6,
                decoration: ShapeDecoration(
                  color: AppColors.greyColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'What is your rate?',
                style: AppStyles.styleSimiBold18(context),
              ),
              const SizedBox(height: 17),
              _buildRatingBar(),
              SizedBox(height: widget.mediaQuery.size.height / 28),
              Text(
                'Please share your opinion\nabout the product',
                style: AppStyles.styleSimiBold18(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              CustomTextFormField(
                maxLines: 8,
                hintText: 'Your review',
                controller: reviewController,
                validator: (value) => validateGeneral(value, 'review'),
              ),
              SizedBox(height: widget.mediaQuery.size.height / 20),
              SubmitReviewButton(
                ratingAndReviewCubit: ratingAndReviewCubit,
                reviewController: reviewController,
                formKey: formKey,
                rating: rating,
                product: widget.product,
                scrollController: widget.scrollController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  RatingBar _buildRatingBar() {
    return RatingBar(
      itemSize: 50,
      allowHalfRating: true,
      updateOnDrag: true,
      itemPadding: const EdgeInsets.all(6),
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: AppColors.yellowColor,
        ),
        half: Icon(
          Icons.star_half,
          color: AppColors.yellowColor,
        ),
        empty: Icon(
          Icons.star_border,
          color: AppColors.greyColor,
        ),
      ),
      onRatingUpdate: (value) {
        rating = value;
        setState(() {});
      },
    );
  }
}
