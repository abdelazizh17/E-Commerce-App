import 'dart:convert';
import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

String? validateEmail(String? value) {
  final RegExp regex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  if (value == null || value.isEmpty) {
    return "Please Enter Email";
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid Email';
    } else {
      return null;
    }
  }
}

String? validatePassword(String? value) {
  if (value?.trim() == null || value!.trim().isEmpty) {
    return 'Please enter password';
  } else if (value.length < 6) {
    return "Password can't be less than 6 characters";
  }
  return null;
}

String? validateGeneral(String? value, String label) {
  if (value == null || value.isEmpty) {
    return 'Please enter $label';
  }
  return null;
}

void showSnackBar(BuildContext context, String msg, Color color) {
  //fix issue duplicate snackbar message because the `listener` was triggered repeatedly for the same `AuthError` state.
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        msg,
        style: AppStyles.styleMedium14(),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

String getMonthName(int month) {
  const months = [
    "",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  return months[month];
}

String formatCategoryName(String name) {
  if (name.startsWith('womens-')) {
    name = name.replaceFirst('womens-', '');
  } else if (name.startsWith('mens-')) {
    name = name.replaceFirst('mens-', '');
  }

  name = name.replaceAll('-', ' ');

  return name.split(' ').map((word) {
    if (word.isEmpty) return '';
    return word[0].toUpperCase() + word.substring(1);
  }).join(' ');
}

List<String> encodeProducts(List<Product> products) {
  return products.map((product) => jsonEncode(product.toJson())).toList();
}

List<Product> decodeProducts(List<String> jsonStringList) {
  return jsonStringList
      .map((jsonString) => Product.fromJson(jsonDecode(jsonString)))
      .toList();
}
