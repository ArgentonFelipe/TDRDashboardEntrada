import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../shared/utils/screen_manager/grid_columns/grid_columns.dart';
import '../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../stores/orders_store/orders_store.dart';
import 'sub_components/conference_type_chart/conference_type_chart.dart';
import 'sub_components/filter_tile/filter_tile.dart';
import 'sub_components/next_update/next_update.dart';
import 'sub_components/search_card/search_card.dart';
import 'sub_components/status_order_chart/status_order_chart.dart';

class RightMenu extends StatefulWidget {
  const RightMenu({
    super.key,
  });
  @override
  _RightMenuState createState() => _RightMenuState();
}

class _RightMenuState extends State<RightMenu> {
  final ordersStore = Modular.get<OrdersStore>();
  final menuScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          context.isDesktopXlDOWN ? context.columnSize3 : context.columnSize2,
      height: context.screenHeight,
      child: SingleChildScrollView(
        controller: menuScrollController,
        child: Watch(
          (_) {
            return Column(
              children: <Widget>[
                Card(
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16,
                      ),
                      child: Center(
                        child: Watch(
                          (_) {
                            return Text(
                              'Versão ${ordersStore.version}',
                              style: TextStyleApp.title.copyWith(
                                fontSize: context.isTabletDOWN
                                    ? 12
                                    : context.isDesktopXlDOWN
                                        ? 13
                                        : 14,
                              ),
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const NextUpdate(),
                const SearchCard(),
                const FilterTile(),
                StatusOrderChart(
                  notBeginingQuantity: ordersStore.notBeginingQuantity,
                  inConferenceQuantity: ordersStore.inConferenceQuantity,
                  conferedQuantity: ordersStore.conferedOrdersQuantity,
                ),
                ConferenceTypeChart(
                  separatedByPaper: ordersStore.separatedByPaperQuantity,
                  separatedBySmartphone:
                      ordersStore.separatedByCellphoneQuantity,
                  newQuantity: ordersStore.notBeginingQuantity,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
