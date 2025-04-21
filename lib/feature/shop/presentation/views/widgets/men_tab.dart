import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MenTab extends StatelessWidget {
  const MenTab({super.key});

  @override
  Widget build(BuildContext context) {


    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 20.h),
        ),
        // CategoryCardSliverListView(),
        SliverToBoxAdapter(
          child: SizedBox(height: 20.h),
        ),
      ],
    );
  }
}
