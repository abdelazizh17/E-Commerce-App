import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.title,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.controller,
    this.isRequired = true,
    required this.labelText,
  });

  final TextEditingController? controller;
  final String? title;
  final Widget? suffixIcon;
  final bool obscureText;
  final String labelText;
  final bool isRequired;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(24),
        filled: true,
        fillColor: AppColors.whiteColor,
        labelText: labelText,
        suffixIcon: suffixIcon,
        enabledBorder: borderBuilder(),
        focusedBorder: borderBuilder(),
      ),
    );
  }

  OutlineInputBorder borderBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
