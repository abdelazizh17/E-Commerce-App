import 'package:e_commerce/core/widgets/custom_sliver_app_bar.dart';
import 'package:e_commerce/feature/profile/presentation/views/widgets/profile_footer_section.dart';
import 'package:e_commerce/feature/profile/presentation/views/widgets/profile_header_section.dart';
import 'package:flutter/material.dart';

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
        ProfileFooterSection()
      ],
    );
  }
}

