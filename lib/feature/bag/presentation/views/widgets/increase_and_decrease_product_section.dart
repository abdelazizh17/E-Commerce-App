import 'package:e_commerce/core/data/models/product/product.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/feature/bag/presentation/viewmodels/bag_cubit/bag_cubit.dart';
import 'package:e_commerce/feature/bag/presentation/views/widgets/custom_floating_action_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class IncreaseAndDecreaseProductSection extends StatefulWidget {
  const IncreaseAndDecreaseProductSection({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  State<IncreaseAndDecreaseProductSection> createState() =>
      _IncreaseAndDecreaseProductSectionState();
}

class _IncreaseAndDecreaseProductSectionState
    extends State<IncreaseAndDecreaseProductSection> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BagCubit>();
    return Row(
      children: [
        CustomFloatingActionButton(
          iconData: LucideIcons.minus,
          onPressed: (widget.product.quantity == 1)
              ? null
              : () {
                  setState(() {
                    widget.product.quantity--;
                  });
                  cubit.updateProductQuantity(widget.product);
                },
        ),
        SizedBox(width: 16),
        Text(
          widget.product.quantity.toString(),
          style: AppStyles.styleMediumTheme14(context),
        ),
        SizedBox(width: 16),
        CustomFloatingActionButton(
          iconData: LucideIcons.plus,
          onPressed: (widget.product.stock == widget.product.quantity)
              ? null
              : () {
                  setState(() {
                    widget.product.quantity++;
                  });
                  cubit.updateProductQuantity(widget.product);
                },
        )
      ],
    );
  }
}

