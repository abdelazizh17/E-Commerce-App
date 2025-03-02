import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/feature/auth/presentation/viewmodels/cubit/auth_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_quick_auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomQuickAuthButtonSection extends StatelessWidget {
  const CustomQuickAuthButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthUserDataLoaded) {
              Navigator.pushReplacementNamed(context, Routes.homeLayout);
            }
          },
          child: CustomQuickAuthButton(
            onPressed: () {
              authCubit.signInwithGoogle();
            },
            image: Assets.imagesGoogle,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        CustomQuickAuthButton(
          onPressed: () {
            authCubit.signInWithFacebook();
          },
          image: Assets.imagesFacebook,
        ),
      ],
    );
  }
}
