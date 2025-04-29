import 'package:e_commerce/feature/bag/presentation/views/widgets/bag_view_body.dart';
import 'package:flutter/material.dart';
class BagView extends StatelessWidget {
  const BagView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BagViewBody(),
    );
  }
}
