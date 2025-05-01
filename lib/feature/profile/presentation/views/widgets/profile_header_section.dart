import '../../../../../core/widgets/title_screen.dart';
import 'user_profile_tile.dart';
import 'package:flutter/material.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleScreen(title: 'My Profile'),
            SizedBox(
              height: 15,
            ),
            UserProfileTile(),
          ],
        ),
      ),
    );
  }
}
