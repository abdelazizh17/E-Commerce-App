import '../../../../../core/widgets/custom_sliver_app_bar.dart';
import 'login_footer_section.dart';
import 'login_header_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        LoginHeaderSection(),
        LoginFooterSection(),
      ],
    );
  }
}
