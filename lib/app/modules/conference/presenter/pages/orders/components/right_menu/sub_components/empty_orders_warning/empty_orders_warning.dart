import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class EmptyOrderWarning extends StatelessWidget {
  final bool isVisible;

  const EmptyOrderWarning({
    super.key,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.isVisible,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: context.isTabletDOWN
                      ? 40
                      : context.isDesktopXlDOWN
                          ? 50
                          : 60,
                ),
                const SizedBox(height: 10),
                Text(
                  'Aguardando pedidos',
                  style: TextStyleApp.body.copyWith(
                    fontSize: context.isTabletDOWN
                        ? 14
                        : context.isDesktopXlDOWN
                            ? 15
                            : 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
