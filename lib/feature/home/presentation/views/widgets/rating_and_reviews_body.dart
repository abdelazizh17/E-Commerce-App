import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/linear_gradient_container.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_and_reviews_button_section.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_summary.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/review_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingAndReviewsBody extends StatelessWidget {
  const RatingAndReviewsBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(16.sp),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: RatingSummary(
                  totalRatings: 23,
                  ratingCounts: const [20, 12, 6, 4, 0],
                  product: product,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      '${reviews.length} reviews',
                      style: AppStyles.styleSimiBold24(context),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.045,
                ),
              ),
              ReviewCardSliverList(
                product: product,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: LinearGradientContainer(),
        ),
        Positioned(
          right: 10,
          bottom: 25,
          child: RatingsAndReviewsButtonSection(),
        ),
      ],
    );
  }
}
