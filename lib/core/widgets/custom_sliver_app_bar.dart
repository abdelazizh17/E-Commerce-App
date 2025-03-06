import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.leading,
    this.actions,
    this.title,
  });
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: title,
      centerTitle: true,
      leading: leading,
      actions: actions,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }
}
