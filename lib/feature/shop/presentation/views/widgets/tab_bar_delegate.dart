import 'package:flutter/material.dart';

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 20;

  @override
  double get minExtent => tabBar.preferredSize.height + 20;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
