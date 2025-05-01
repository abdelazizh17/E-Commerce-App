import 'package:flutter/material.dart';

import '../../../../../core/data/helper_methods.dart';
import 'custom_text_form_field.dart';

class CustomTextFormFieldLoginSection extends StatelessWidget {
  const CustomTextFormFieldLoginSection(
      {super.key, required this.email, required this.password});
  final TextEditingController email;
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: 'Email',
          validator: (value) => validateEmail(value),
          controller: email,
        ),
        SizedBox(
          height: 18,
        ),
        CustomTextFormField(
          labelText: 'Password',
          validator: (value) => validatePassword(value),
          obscureText: true,
          controller: password,
        ),
      ],
    );
  }
}
