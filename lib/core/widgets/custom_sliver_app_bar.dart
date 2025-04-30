import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.leading,
    this.actions,
    this.title,
    this.pinned = false,
    this.backgroundColor = Colors.transparent,
    this.surfaceTintColor = Colors.transparent,
  });
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool pinned;
  final Color backgroundColor;
  final Color surfaceTintColor;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      title: title,
      centerTitle: true,
      leading: leading,
      actions: actions,
      pinned: pinned,
      backgroundColor: backgroundColor,
      surfaceTintColor: surfaceTintColor,
    );
  }
}
