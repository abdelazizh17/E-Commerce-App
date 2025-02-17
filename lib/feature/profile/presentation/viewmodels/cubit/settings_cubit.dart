import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(BuildContext context) => BlocProvider.of(context);
  ThemeMode themeMode = ThemeMode.system;

  Future<void> loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    final isDarkMode = pref.getBool('isDarkMode') ?? false;
    emit(SettingsThemeUpdated(isDarkMode: isDarkMode));
  }

  Future<void> toggleTheme() async {
    if (state is SettingsThemeUpdated) {
      try {
        final currentState = state as SettingsThemeUpdated;
        final newMode = !currentState.isDarkMode;

        final pref = await SharedPreferences.getInstance();
        await pref.setBool('isDarkMode', newMode);
        emit(SettingsThemeUpdated(isDarkMode: newMode));
      } catch (e) {
        emit(SettingsFailure(errMessage: 'Failed to save theme mode'));
      }
    }
  }
}
