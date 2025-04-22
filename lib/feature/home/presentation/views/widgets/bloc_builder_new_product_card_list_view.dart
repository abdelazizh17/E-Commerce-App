import 'package:e_commerce/feature/home/presentation/viewmodels/new_products_cubit/new_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_skeletoizer_product_card.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/new_product_list_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderNewProductCardListView extends StatelessWidget {
  const BlocBuilderNewProductCardListView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewProductsCubit, NewProductsState>(
      builder: (context, state) {
        if (state is NewProductsLoading) {
          return const CustomSkeletonizerProductCard();
        } else if (state is NewProductsSuccess) {
          return NewProductListView(products: state.products);
        } else if (state is NewProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
