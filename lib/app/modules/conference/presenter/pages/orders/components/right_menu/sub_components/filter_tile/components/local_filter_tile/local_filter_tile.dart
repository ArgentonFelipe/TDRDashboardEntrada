import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class LocalFilterTile extends StatelessWidget {
  final String label;
  final int value;
  final int localIndex;
  final Function(int?) onChanged;

  const LocalFilterTile({
    super.key,
    required this.localIndex,
    required this.onChanged,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Radio<int>(
          value: this.value,
          groupValue: this.localIndex,
          onChanged: (newValue) => onChanged(newValue),
          activeColor: ColorsApp.red,
        ),
        Text(
          this.label,
          style: TextStyleApp.body.copyWith(
            fontSize: context.isTabletDOWN
                ? 14
                : context.isDesktopXlDOWN
                    ? 15
                    : 16,
          ),
        ),
      ],
    );
  }
}
