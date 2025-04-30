import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/feature/bag/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/rating_and_review_cubit/rating_and_review_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_details_body_section.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_details_image_page_view.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_details_rating_and_review_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  late Product currentProduct;
  @override
  void initState() {
    currentProduct = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingAndReviewCubit, RatingAndReviewState>(
      listener: (context, state) {
        if (state is ProductsDetailUpdated &&
            currentProduct.id == state.product.id) {
          currentProduct = state.product;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductDetailsImagePageView(
                product: currentProduct,
              ),
              ProductDetailsBodySection(
                product: currentProduct,
              ),
              CustomDivider(),
              ProductDetailsRatingAndReviewsSection(
                product: currentProduct,
              ),
              CustomDivider(),
              SizedBox(
                height: 16,
              ),
              CustomButton(
                padding: const EdgeInsets.all(16),
                onPressed: () {
                  final cubit = context.read<BagCubit>();
                  final isProductInBag = cubit.isProductInbag(currentProduct);
                  if (!isProductInBag) {
                    cubit.addBagProduct(currentProduct);
                    setState(() {
                      showSnackBar(
                        context,
                        'Added to Cart ✅',
                        AppColors.greenColor,
                      );
                    });
                  } else {
                    setState(() {
                      showSnackBar(
                        context,
                        'You’ve already added this one to Cart!',
                        AppColors.primaryColor,
                      );
                    });
                  }
                },
                widget: Text(
                  'ADD TO CART',
                  style: AppStyles.styleMedium14(),
                ),
                height: 50.h,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        );
      },
    );
  }
}
