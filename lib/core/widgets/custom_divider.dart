import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.05,
      child: Divider(
        color: Color(0xFFABB4BD),
        height: 0,
      ),
    );
  }
}
