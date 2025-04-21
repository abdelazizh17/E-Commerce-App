import 'package:bloc/bloc.dart';
import 'package:e_commerce/feature/bag/presentation/views/bag_view.dart';
import 'package:e_commerce/feature/favorites/presentation/views/favorites_view.dart';
import 'package:e_commerce/feature/home/presentation/views/home_view.dart';
import 'package:e_commerce/feature/profile/presentation/views/profile_view.dart';
import 'package:e_commerce/feature/shop/presentation/views/shop_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());
  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  final List<Widget> screens = [
    HomeView(),
    ShopView(),
    BagView(),
    FavoritesView(),
    ProfileView(),
  ];
  int currentIndex = 0;

  void changeTap(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(HomeLayoutTapChanged(currentIndex));
    }
  }
}
