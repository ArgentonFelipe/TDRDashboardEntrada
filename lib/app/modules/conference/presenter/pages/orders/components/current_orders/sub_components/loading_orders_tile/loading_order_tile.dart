import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../shared/utils/screen_manager/grid_columns/grid_columns.dart';
import '../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';

class LoadingOrderTile extends StatefulWidget {
  const LoadingOrderTile({super.key});

  @override
  State<LoadingOrderTile> createState() => _LoadingOrderTileState();
}

class _LoadingOrderTileState extends State<LoadingOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                  const CircularProgressIndicator(
                    color: ColorsApp.red,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Atualizando lista de pedidos. Por favor, aguarde',
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
