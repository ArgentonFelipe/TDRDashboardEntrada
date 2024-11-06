import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class GraphIndicator extends StatelessWidget {
  final String label;
  final Color color;

  const GraphIndicator({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          color: this.color,
        ),
        const SizedBox(width: 5),
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
