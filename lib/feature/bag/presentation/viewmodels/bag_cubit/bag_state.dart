part of 'bag_cubit.dart';

@immutable
sealed class BagState {}

final class BagInitial extends BagState {}

final class BagLoading extends BagState {}

final class BagProductAdded extends BagState {}

final class BagProductLoaded extends BagState {
  final List<Product> products;

  BagProductLoaded(this.products);
}

final class BagProductFailure extends BagState {
  final String errMessage;

  BagProductFailure(this.errMessage);
}
