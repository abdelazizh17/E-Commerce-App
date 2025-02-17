import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/profile/presentation/viewmodels/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Row(
        children: [
          const Icon(
            Icons.dark_mode_outlined,
            size: 28,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Dark Mode",
            style: AppStyles.styleSimiBold16(context),
          ),
          const Spacer(),
          BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              bool isDarkMode = false;
              if (state is SettingsThemeUpdated) {
                isDarkMode = state.isDarkMode;
              }
              return Switch(
                activeColor: AppColors.primaryColor,
                value: isDarkMode,
                onChanged: (value) {
                  context.read<SettingsCubit>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
