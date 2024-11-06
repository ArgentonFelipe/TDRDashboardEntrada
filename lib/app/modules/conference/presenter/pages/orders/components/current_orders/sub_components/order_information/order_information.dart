import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class OrderInformation extends StatelessWidget {
  final String information;
  final IconData icon;
  final bool isVisible;
  final Color color;

  const OrderInformation({
    super.key,
    required this.information,
    required this.icon,
    required this.isVisible,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.isVisible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            this.icon,
            color: this.color,
            size: context.isTabletDOWN
                ? 14
                : context.isDesktopXlDOWN
                    ? 16
                    : 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              this.information,
              style: TextStyleApp.body.copyWith(
                fontSize: context.isTabletDOWN
                    ? 14
                    : context.isDesktopXlDOWN
                        ? 16
                        : 18,
                color: this.color,
                fontWeight: FontWeight.normal,
              ),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.start,
              maxLines: 1,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
