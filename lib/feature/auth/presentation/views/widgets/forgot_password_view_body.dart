import '../../../../../core/data/helper_methods.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_sliver_app_bar.dart';
import '../../viewmodels/cubit/auth_cubit.dart';
import 'custom_button_forgot_password_bloc_consumer.dart';
import 'custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    final formKey = GlobalKey<FormState>();
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        SliverToBoxAdapter(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot password',
                    style: AppStyles.styleBold34(context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 9,
                  ),
                  Text(
                    'Please, enter your email address. You will receive a link to create a new password via email.',
                    style: AppStyles.styleMediumTheme14(context),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    labelText: 'Email',
                    validator: (value) => validateEmail(value),
                    controller: authCubit.emailController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 11,
                  ),
                  CustomButtonForgotPasswordBlocConsumer(
                    authCubit: authCubit,
                    formKey: formKey,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
