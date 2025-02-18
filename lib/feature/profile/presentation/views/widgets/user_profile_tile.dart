import 'package:e_commerce/core/data/models/user_model.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    authCubit.fetchUserData();
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage(Assets.imagesProf1),
        ),
        SizedBox(
          width: 19,
        ),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            UserModel? userModel;
            if (state is AuthUserDataLoaded) {
              userModel = state.userModel;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel?.userName ?? '',
                  style: AppStyles.styleSimiBold18(context),
                ),
                Text(
                  userModel?.email ?? '',
                  style: AppStyles.styleMedium14().copyWith(
                    color: AppColors.greyColor,
                  ),
                )
              ],
            );
          },
        )
      ],
    );
  }
}
