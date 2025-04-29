import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/favorites/presentation/viewmodels/favorites_products_cubit/favorite_products_cubit.dart';
import 'package:e_commerce/feature/favorites/presentation/views/widgets/favorite_product_list.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavoritesViewBody extends StatefulWidget {
  const FavoritesViewBody({super.key});

  @override
  State<FavoritesViewBody> createState() => _FavoritesViewBodyState();
}

class _FavoritesViewBodyState extends State<FavoritesViewBody> {

  @override
  void initState() {
    context.read<FavoriteProductsCubit>().fetchFavoriteProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          title: Text(
            'Favorites',
            style: AppStyles.styleSimiBold18(context).copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        FavoriteProductsList(),
      ],
    );
  }
}

