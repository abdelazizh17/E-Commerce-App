import '../../../../../core/data/helper_methods.dart';
import '../../../data/models/product/product.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../viewmodels/bag_cubit/bag_cubit.dart';
import 'custom_floating_action_button.dart';
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
          heroTag: 'decrease',
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
          heroTag: 'increase',
          iconData: LucideIcons.plus,
          onPressed: () {
            if (widget.product.quantity == widget.product.stock) {
              showSnackBar(
                  context,
                  'You’ve reached the maximum quantity available in stock.',
                  AppColors.primaryColor);
              return;
            }
            setState(() {
              widget.product.quantity++;
            });
            cubit.updateProductQuantity(widget.product);
          },
        ),
      ],
    );
  }
}
