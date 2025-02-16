import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/feature/home_layout/presentation/viewmodels/cubit/home_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
      builder: (context, state) {
        final homeLayoutCubit = HomeLayoutCubit.get(context);

        return Scaffold(
          body: homeLayoutCubit.screens[homeLayoutCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeLayoutCubit.currentIndex,
            onTap: homeLayoutCubit.changeTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.whiteColor,
            selectedIconTheme:
                IconThemeData(color: AppColors.primaryColor, size: 30),
            unselectedIconTheme:
                IconThemeData(color: AppColors.greyColor, size: 25),
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyColor,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.shoppingCart,
                ),
                label: "Shop",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.shoppingBag,
                ),
                label: "Bag",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.heart,
                ),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  LucideIcons.user,
                ),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
