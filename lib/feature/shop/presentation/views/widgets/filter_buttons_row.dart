import '../../viewmodels/get_all_products_cubit/get_all_products_cubit.dart';
import 'filter_bottom_sheet.dart';
import 'filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FilterButtonsRow extends StatelessWidget {
  const FilterButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GetAllProductsCubit>();
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
            title: cubit.selectedFromSort,
            iconData: Icons.import_export,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) {
                  return FilterBotttomSheet(
                    cubit: cubit,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
