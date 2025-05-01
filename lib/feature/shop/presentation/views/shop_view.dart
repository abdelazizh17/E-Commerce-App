import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/injection.dart';
import '../../data/repository/category_item_repo.dart';
import '../viewmodels/category_items_cubit/category_items_cubit.dart';
import 'widgets/shop_view_body.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryItemsCubit(getIt<CategoryItemRepo>()),
      child: Scaffold(
        body: ShopViewBody(),
      ),
    );
  }
}
