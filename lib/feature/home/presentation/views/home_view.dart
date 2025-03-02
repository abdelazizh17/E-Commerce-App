import 'package:e_commerce/core/utils/injection.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/new_products_cubit/new_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/viewmodels/sale_product_cubit/sale_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final SaleProductsCubit saleProductsCubit;
  late final NewProductsCubit newProductsCubit;

  @override
  void initState() {
    super.initState();
    saleProductsCubit = getIt<SaleProductsCubit>()..getSaleProducts();
    newProductsCubit = getIt<NewProductsCubit>()..getNewProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: saleProductsCubit),
        BlocProvider.value(value: newProductsCubit),
      ],
      child: Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
