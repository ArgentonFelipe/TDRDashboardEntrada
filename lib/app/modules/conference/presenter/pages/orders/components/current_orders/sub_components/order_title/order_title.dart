import 'package:flutter/material.dart';
import 'package:tdr_core/utils/styles/text_styles/text_styles.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../../../domain/entities/order/order.dart';

class OrderTitle extends StatelessWidget {
  final Order order;

  const OrderTitle({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            'N° ${this.order.orderNumber}',
            style: TextStyleApp.title.copyWith(
              fontSize: context.isTabletDOWN
                  ? 20
                  : context.isDesktopXlDOWN
                      ? 22
                      : 24,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          this.order.conferenceStatus.description,
          style: TextStyleApp.subtitle.copyWith(
            color: this.order.conferenceStatus.color,
            fontSize: context.isTabletDOWN
                ? 16
                : context.isDesktopXlDOWN
                    ? 18
                    : 20,
          ),
        ),
      ],
    );
  }
}
