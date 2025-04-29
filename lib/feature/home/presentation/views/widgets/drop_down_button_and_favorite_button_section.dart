import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/feature/favorites/presentation/viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_drop_down_button_form_field.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_favorite_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownButtonAndFavoriteButtonSection extends StatelessWidget {
  const DropDownButtonAndFavoriteButtonSection({
    super.key, required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropdownButtonFormField(
            itemList: sizeList,
            hint: 'Size',
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomDropdownButtonFormField(
            itemList: colorList,
            hint: 'Color',
          ),
        ),
        SizedBox(
          width: 16,
        ),
        BlocBuilder<FavoriteProductsCubit, FavoriteProductsState>(
          builder: (context, state) {
            final cubit = context.read<FavoriteProductsCubit>();
            final isFavorite = cubit.isProductFavorite(product);
            return CustomFavoriteButton(
              onPressed: () {
                if (isFavorite) {
                  cubit.removeFavoriteProduct(product);
                } else {
                  cubit.addFavoriteProduct(product);
                }
              },
              isFavorite: isFavorite,
            );
          },
        ),
      ],
    );
  }
}
