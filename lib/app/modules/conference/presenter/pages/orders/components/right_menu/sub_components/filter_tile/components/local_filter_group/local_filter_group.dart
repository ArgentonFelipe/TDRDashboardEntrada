import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../../../../stores/local_filter_store/local_filter_store.dart';
import '../local_filter_tile/local_filter_tile.dart';

class LocalFilterGroup extends StatelessWidget {
  LocalFilterGroup({super.key});
  final localFilterStore = Modular.get<LocalFilterStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Local',
            style: TextStyleApp.title.copyWith(
              fontSize: context.isTabletDOWN
                  ? 16
                  : context.isDesktopXlDOWN
                      ? 17
                      : 18,
            ),
          ),
          const Divider(),
          Watch(
            (_) {
              return Wrap(
                alignment: context.isTabletDOWN
                    ? WrapAlignment.start
                    : WrapAlignment.center,
                children: [
                  LocalFilterTile(
                    value: 0,
                    label: 'Todos',
                    onChanged: localFilterStore.changeLocalFilterValue,
                    localIndex: localFilterStore.local.value,
                  ),
                  LocalFilterTile(
                    value: 1,
                    label: 'Expedição',
                    onChanged: localFilterStore.changeLocalFilterValue,
                    localIndex: localFilterStore.local.value,
                  ),
                  LocalFilterTile(
                    value: 2,
                    label: 'Docas',
                    onChanged: localFilterStore.changeLocalFilterValue,
                    localIndex: localFilterStore.local.value,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
