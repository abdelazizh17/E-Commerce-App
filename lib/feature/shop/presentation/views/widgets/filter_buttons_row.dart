import 'package:e_commerce/feature/shop/presentation/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FilterButtonsRow extends StatelessWidget {
  const FilterButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterButton(
            title: 'Filters',
            iconData: LucideIcons.listFilter,
            onPressed: () {},
          ),
          FilterButton(
            title: 'Price: lowest to high',
            iconData: Icons.import_export,
            onPressed: () {},
          ),
          FilterButton(
            iconData: LucideIcons.list,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

