import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../shared/utils/screen_manager/grid_columns/grid_columns.dart';
import '../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class LoadingTile extends StatelessWidget {
  const LoadingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
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
                    SizedBox(
                      width: context.isTabletDOWN
                          ? 30
                          : context.isDesktopXlDOWN
                              ? 40
                              : 50,
                      height: context.isTabletDOWN
                          ? 30
                          : context.isDesktopXlDOWN
                              ? 40
                              : 50,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ColorsApp.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Carregando lista de pedidos. Por favor aguarde',
                      style: TextStyleApp.body.copyWith(
                        fontSize: context.isTabletDOWN
                            ? 18
                            : context.isDesktopXlDOWN
                                ? 20
                                : 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
