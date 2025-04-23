import 'package:e_commerce/feature/home/presentation/viewmodels/sale_product_cubit/sale_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_skeletoizer_product_card.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/sale_product_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderSaleProductCardListView extends StatelessWidget {
  const BlocBuilderSaleProductCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaleProductsCubit, SaleProductsState>(
      builder: (context, state) {
        if (state is SaleProductsLoading) {
          return const CustomSkeletonizerProductCardListView();
        } else if (state is SaleProductsSuccess) {
          return SaleProductListView(products: state.products);
        } else if (state is SaleProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
