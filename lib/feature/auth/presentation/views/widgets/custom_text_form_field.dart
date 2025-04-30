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
    this.labelText,
    this.hintText,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String? title;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? labelText;
  final bool isRequired;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(24),
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.whiteColor
            : AppColors.transparent,
        labelText: labelText,
        hintText: hintText,
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
