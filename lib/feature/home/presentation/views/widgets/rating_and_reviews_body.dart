import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/linear_gradient_container.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_and_reviews_button_section.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/rating_summary.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/review_card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingAndReviewsBody extends StatefulWidget {
  const RatingAndReviewsBody({super.key, required this.product});
  final Product product;

  @override
  State<RatingAndReviewsBody> createState() => _RatingAndReviewsBodyState();
}

class _RatingAndReviewsBodyState extends State<RatingAndReviewsBody> {
  late ScrollController _scrollController;
  late Product currentProduct;
  @override
  void initState() {
    _scrollController = ScrollController();
    currentProduct = widget.product;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingAndReviewCubit, RatingAndReviewState>(
      listener: (context, state) {
        if (state is SaleProductsDetailUpdated) {
          setState(() {
            currentProduct = state.product;
          });
        }

        _buildScrollController();
      },
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: RatingSummary(
                    totalRatings: currentProduct.reviews!.length,
                    ratingCounts: const [20, 12, 6, 4, 0],
                    product: currentProduct,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    '${currentProduct.reviews!.length} reviews',
                    style: AppStyles.styleSimiBold24(context),
                    textAlign: TextAlign.left,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                ),
                ReviewCardSliverList(
                  product: currentProduct,
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
            child: RatingsAndReviewsButtonSection(
              product: currentProduct,
            ),
          ),
        ],
      ),
    );
  }

  void _buildScrollController() {
    return WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_scrollController.hasClients || !mounted) return;

      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
      );

      if (!_scrollController.hasClients || !mounted) return;

      if (_scrollController.offset <
          _scrollController.position.maxScrollExtent) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }
}
