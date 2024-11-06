import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/grid_columns/grid_columns.dart';
import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class EmptyOrdersTile extends StatelessWidget {
  const EmptyOrdersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: context.isTabletDOWN
              ? context.columnSize5
              : context.isDesktopXlDOWN
                  ? context.columnSize4
                  : context.columnSize3,
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    size: context.isTabletDOWN
                        ? 50
                        : context.isDesktopXlDOWN
                            ? 70
                            : 80,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Não existem pedidos para exibição. Por favor aguarde até que um pedido seja enviado ou verifique os filtros aplicados',
                    style: TextStyleApp.title.copyWith(
                      fontSize: context.isTabletDOWN
                          ? 14
                          : context.isDesktopXlDOWN
                              ? 15
                              : 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
