import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_sliver_app_bar.dart';
import 'profile_footer_section.dart';
import 'profile_header_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        ProfileHeaderSection(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 18,
          ),
        ),
        ProfileFooterSection(),
      ],
    );
  }
}
