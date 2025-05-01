import '../../../../bag/data/models/product/product.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../auth/presentation/views/widgets/custom_button.dart';
import '../../viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'write_review_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingsAndReviewsButtonSection extends StatelessWidget {
  const RatingsAndReviewsButtonSection({
    super.key,
    required this.product,
    required this.scrollController,
  });
  final Product product;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return CustomButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) {
            return WriteReviewBottomSheet(
              mediaQuery: mediaQuery,
              product: product,
              ratingAndReviewCubit: context.read<RatingAndReviewCubit>(),
              scrollController: scrollController,
            );
          },
        );
      },
      padding: EdgeInsets.all(15),
      width: 128.w,
      height: 36.h,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.pen,
            size: 20,
            color: AppColors.whiteColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Write a review',
            style: AppStyles.styleSimiBold11(),
          ),
        ],
      ),
    );
  }
}
