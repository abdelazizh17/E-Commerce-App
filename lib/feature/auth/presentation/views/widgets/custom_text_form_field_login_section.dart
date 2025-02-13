import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldLoginSection extends StatelessWidget {
  const CustomTextFormFieldLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          labelText: 'Email',
        ),
        SizedBox(
          height: 18,
        ),
        CustomTextFormField(
          labelText: 'Password',
        ),
      ],
    );
  }
}