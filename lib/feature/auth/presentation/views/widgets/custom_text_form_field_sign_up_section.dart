import '../../../../../core/data/helper_methods.dart';
import 'custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldSignUpSection extends StatelessWidget {
  const CustomTextFormFieldSignUpSection(
      {super.key,
      required this.userName,
      required this.email,
      required this.password});
  final TextEditingController userName;
  final TextEditingController email;
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          validator: (value) => validateGeneral(value, 'name'),
          labelText: 'Name',
          controller: userName,
        ),
        SizedBox(
          height: 18,
        ),
        CustomTextFormField(
          validator: (value) => validateEmail(value),
          labelText: 'Email',
          controller: email,
        ),
        SizedBox(
          height: 18,
        ),
        CustomTextFormField(
          validator: (value) => validatePassword(value),
          labelText: 'Password',
          controller: password,
          obscureText: true,
        ),
      ],
    );
  }
}
