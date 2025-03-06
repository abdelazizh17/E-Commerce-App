import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.25,
      child: Divider(
        color: Color(0xFF9B9B9B),
        height: 0,
      ),
    );
  }
}
