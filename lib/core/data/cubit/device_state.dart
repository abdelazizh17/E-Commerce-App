part of 'device_cubit.dart';

@immutable
sealed class DeviceState {}

final class DeviceInitial extends DeviceState {}

final class DeviceLoading extends DeviceState {}

final class DeviceMobile extends DeviceState {}

final class DeviceTablet extends DeviceState {}
