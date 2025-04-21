import 'package:e_commerce/core/utils/injection.dart';
import 'package:e_commerce/feature/shop/presentation/viewmodels/category_items_cubit/category_items_cubit.dart';
import 'package:e_commerce/feature/shop/presentation/views/widgets/shop_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryItemsCubit>(),
      child: Scaffold(
        body: ShopViewBody(),
      ),
    );
  }
}
