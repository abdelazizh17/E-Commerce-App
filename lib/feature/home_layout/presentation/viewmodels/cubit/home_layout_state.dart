part of 'home_layout_cubit.dart';

@immutable
sealed class HomeLayoutState {}

final class HomeLayoutInitial extends HomeLayoutState {}

final class HomeLayoutTapChanged extends HomeLayoutState {
  final int index;

  HomeLayoutTapChanged(this.index);
}
