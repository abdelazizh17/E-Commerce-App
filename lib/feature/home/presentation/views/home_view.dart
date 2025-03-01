import 'package:e_commerce/core/utils/injection.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/new_products_cubit/new_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/sale_product_cubit/sale_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SaleProductsCubit>(
          create: (_) => getIt<SaleProductsCubit>()..getSaleProducts(),
        ),
        BlocProvider<NewProductsCubit>(
          create: (_) => getIt<NewProductsCubit>()..getNewProduct(),
        ),
      ],
      child: Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
