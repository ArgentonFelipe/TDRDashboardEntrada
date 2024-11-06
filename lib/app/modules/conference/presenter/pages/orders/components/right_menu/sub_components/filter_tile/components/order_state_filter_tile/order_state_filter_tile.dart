import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class OrderStateFilterTile extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool?) onChanged;

  const OrderStateFilterTile({
    super.key,
    required this.onChanged,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          this.label,
          style: TextStyleApp.body.copyWith(
            fontSize: context.isTabletDOWN
                ? 14
                : context.isDesktopXlDOWN
                    ? 16
                    : 18,
          ),
        ),
        Switch(
          value: this.value,
          onChanged: this.onChanged,
          activeColor: ColorsApp.red,
        ),
      ],
    );
  }
}
