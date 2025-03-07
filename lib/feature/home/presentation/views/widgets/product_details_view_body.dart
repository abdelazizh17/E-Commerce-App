import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_divider.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_details_header_section.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_details_image_page_view.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_details_rating_and_review_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Builder(builder: (context) {
      return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProductDetailsImagePageView(
                product: product,
              ),
              SizedBox(
                height: 12,
              ),
              ProductDetailsHeaderSection(product: product),
              CustomDivider(),
              ProductDetailsRatingAndReviewsSection(
                product: product,
              ),
              CustomDivider(),
              SizedBox(
                height: 16,
              ),
              CustomButton(
                padding: const EdgeInsets.all(16),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //todo : navigate to another screen
                  }
                },
                widget: Text(
                  'ADD TO CART',
                  style: AppStyles.styleMedium14(),
                ), height: 50.h,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      );
    });
  }
}
