import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 413.h,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });

                /// **تحريك الصفحة بأنيميشن معين**
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.decelerate,
                );
              },
              itemCount: widget.product.images!.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    index == 0 ? EdgeInsets.zero : EdgeInsets.only(left: 4),
                child: ProductDetailsImage(
                  imageUrl: widget.product.images![index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275.w,
      height: 413.h,
      decoration: BoxDecoration(
        color: Color(0xffEFEEEC),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            LottieBuilder.asset(Assets.imagesLoading),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
