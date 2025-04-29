import 'package:e_commerce/core/data/helper_methods.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatefulWidget {
  const CustomDropdownButtonFormField(
      {super.key, required this.itemList, required this.hint, this.onChanged});
  final List<String> itemList;
  final void Function(String?)? onChanged;
  final String hint;

  @override
  State<CustomDropdownButtonFormField> createState() =>
      _CustomDropdownButtonFormFieldState();
}

class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        validator: (value) => validateGeneral(value, widget.hint.toLowerCase()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: selectedValue,
        hint: Text(widget.hint),
        decoration: InputDecoration(
          border: borderBuilder(AppColors.greyColor),
          focusedBorder: borderBuilder(AppColors.primaryColor),
        ),
        items: widget.itemList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
        onChanged: widget.onChanged);
  }

  OutlineInputBorder borderBuilder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
