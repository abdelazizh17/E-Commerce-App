import 'package:e_commerce/feature/bag/data/models/product/product.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/product_details_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsImagePageView extends StatefulWidget {
  const ProductDetailsImagePageView({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailsImagePageView> createState() =>
      _ProductDetailsImagePageViewState();
}

class _ProductDetailsImagePageViewState
    extends State<ProductDetailsImagePageView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 413.h,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 600),
            curve: Curves.decelerate,
          );
        },
        itemCount: widget.product.images!.length,
        itemBuilder: (context, index) => Padding(
          padding: index == 0 ? EdgeInsets.zero : EdgeInsets.only(left: 4),
          child: ProductDetailsImage(
            imageUrl: widget.product.images![index],
          ),
        ),
      ),
    );
  }
}
