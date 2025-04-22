import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/feature/shop/data/models/category_item.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/category_items_cubit/category_items_cubit.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/custom_skeletoizer_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_card_sliver_list_view.dart';

class GenericCategoryTab extends StatefulWidget {
  final String category;

  const GenericCategoryTab({super.key, required this.category});

  @override
  State<GenericCategoryTab> createState() => _GenericCategoryTabState();
}

class _GenericCategoryTabState extends State<GenericCategoryTab> {
  List<CategoryItem> categoryItem = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    final cubit = context.read<CategoryItemsCubit>();
    cubit.getCategoryItems(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryItemsCubit, CategoryItemsState>(
      listener: (context, state) {
        if (state is CategoryItemsSuccess) {
          categoryItem = state.categoryItem;
        } else if (state is CategoryItemsFailure) {
          showSnackBar(context, state.errMessage, AppColors.primaryColor);
        }
      },
      builder: (context, state) {
        if (state is CategoryItemsLoading) {
          return CustomSkeletonizerCategoryCard();
        }
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            CategoryCardSliverListView(
              categoryItem: categoryItem,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
          ],
        );
      },
    );
  }
}
