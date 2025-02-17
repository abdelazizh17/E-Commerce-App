part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsThemeUpdated extends SettingsState {
  final bool isDarkMode;

  SettingsThemeUpdated({required this.isDarkMode});
}

final class SettingsFailure extends SettingsState {
  final String errMessage;

  SettingsFailure({required this.errMessage});
}
