import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../../../../../stores/conference_status_filter_store/conference_status_filter_store.dart';
import '../order_state_filter_tile/order_state_filter_tile.dart';

class OrderStateFilterGroup extends StatelessWidget {
  OrderStateFilterGroup({super.key});
  final requestStateFilterStore = Modular.get<ConferenceStatusFilterStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Situação',
            style: TextStyleApp.title.copyWith(
              fontSize: context.isTabletDOWN
                  ? 16
                  : context.isDesktopXlDOWN
                      ? 18
                      : 20,
            ),
          ),
          const Divider(),
          Watch(
            (_) {
              return Column(
                children: [
                  OrderStateFilterTile(
                    onChanged:
                        this.requestStateFilterStore.changeNotBeginingFlag,
                    label: 'Não Iniciado',
                    value: requestStateFilterStore.status.canShowNotBegining,
                  ),
                  OrderStateFilterTile(
                    onChanged:
                        this.requestStateFilterStore.changeInConferenceFlag,
                    label: 'Em Conferência',
                    value: requestStateFilterStore.status.canShowInConference,
                  ),
                  OrderStateFilterTile(
                    onChanged: this.requestStateFilterStore.changeConferedFlag,
                    label: 'Finalizado',
                    value: requestStateFilterStore.status.canShowConfered,
                  ),
                  // OrderStateFilterTile(
                  //   onChanged: this.requestStateFilterStore.changeNewFlag,
                  //   label: 'Novo',
                  //   value: requestStateFilterStore.status.canShowNew,
                  // ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
