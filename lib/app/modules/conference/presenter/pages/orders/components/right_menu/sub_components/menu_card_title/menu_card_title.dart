import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class MenuCardTitle extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final Function() onPressed;

  const MenuCardTitle({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            textAlign: TextAlign.center,
            style: TextStyleApp.title.copyWith(
              fontSize: context.isTabletDOWN
                  ? 16
                  : context.isDesktopXlDOWN
                      ? 20
                      : 22,
            ),
          ),
          Icon(
            this.isExpanded
                ? Icons.arrow_drop_up_rounded
                : Icons.arrow_drop_down_rounded,
          ),
        ],
      ),
    );
  }
}
