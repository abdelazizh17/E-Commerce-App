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
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black.withValues(alpha: 0.2)
                      : Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 12,
                  blurRadius: 20,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: BottomNavigationBar(
                elevation: 10,
                currentIndex: homeLayoutCubit.currentIndex,
                onTap: homeLayoutCubit.changeTap,
                type: BottomNavigationBarType.fixed,
                backgroundColor:
                    Theme.of(context).brightness == Brightness.light
                        ? AppColors.whiteColor
                        : AppColors.darkModeBackgroundColor,
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
            ),
          ),
        );
      },
    );
  }
}
