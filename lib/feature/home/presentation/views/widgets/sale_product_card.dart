import '../../../../bag/data/models/product/product.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'product_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaleProductCard extends StatefulWidget {
  const SaleProductCard(
      {super.key, required this.product, required this.isLoading});
  final Product product;
  final bool isLoading;

  @override
  State<SaleProductCard> createState() => _SaleProductCardState();
}

class _SaleProductCardState extends State<SaleProductCard> {
  late Product currentProduct;

  @override
  void initState() {
    currentProduct = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double discountedPrice = currentProduct.price! -
        (currentProduct.price! * (currentProduct.discountPercentage! / 100));
    return BlocConsumer<RatingAndReviewCubit, RatingAndReviewState>(
      listener: (context, state) {
        if (state is ProductsDetailUpdated &&
            currentProduct.id == state.product.id) {
          currentProduct = state.product;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.productDetailsView,
                arguments: currentProduct.copyWith(endPoint: 'sale'));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageContainer(
                products: currentProduct,
                isSale: true,
                isLoading: widget.isLoading,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StarRating(
                      color: AppColors.yellowColor,
                      size: 20,
                      rating: currentProduct.rating!,
                    ),
                    SizedBox(height: 4),
                    Text(
                      currentProduct.brand ?? 'Unkown',
                      style: AppStyles.styleRegularGrey11(),
                    ),
                    SizedBox(
                      width: 120.w,
                      child: Text(
                        currentProduct.title ?? 'Unkown',
                        style: AppStyles.styleRegular16(context),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          Text(
                            "${currentProduct.price!.toStringAsFixed(2)}\$",
                            style: AppStyles.styleMedium14().copyWith(
                              color: AppColors.greyColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "${discountedPrice.toStringAsFixed(2)}\$",
                            style: AppStyles.styleMedium14().copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
