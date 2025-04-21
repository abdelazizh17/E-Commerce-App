import 'package:e_commerce/feature/shop/data/models/category_item.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/category_items_cubit/category_items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/category_card_sliver_list_view.dart';

class WomenTab extends StatefulWidget {
  const WomenTab({super.key});

  @override
  State<WomenTab> createState() => _WomenTabState();
}

class _WomenTabState extends State<WomenTab> {
  List<CategoryItem> categoryItem = [];
  @override
  void initState() {
    CategoryItemsCubit.get(context).getCategoryItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryItemsCubit, CategoryItemsState>(
      listener: (context, state) {
        if (state is CategoryItemsSuccess) {
          categoryItem = state.categoryItem;
        }
      },
      builder: (context, state) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          CategoryCardSliverListView(categoryItem: categoryItem),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
        ],
      ),
    );
  }
}
