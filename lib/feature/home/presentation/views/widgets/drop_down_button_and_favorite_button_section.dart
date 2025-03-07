import 'package:e_commerce/constants.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_drop_down_button_form_field.dart';
import 'package:e_commerce/feature/home/presentation/views/widgets/custom_favorite_button.dart';
import 'package:flutter/widgets.dart';

class DropDownButtonAndFavoriteButtonSection extends StatelessWidget {
  const DropDownButtonAndFavoriteButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomDropdownButtonFormField(
            itemList: sizeList,
            hint: 'Size',
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomDropdownButtonFormField(
            itemList: colorList,
            hint: 'Color',
          ),
        ),
        SizedBox(
          width: 16,
        ),
        CustomFavoriteButton(),
      ],
    );
  }
}
