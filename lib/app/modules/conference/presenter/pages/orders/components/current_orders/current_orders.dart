import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../../shared/utils/screen_manager/grid_columns/grid_columns.dart';
import '../../../../../../../shared/utils/screen_manager/screen_size/screen_size.dart';
import '../../../../stores/orders_store/orders_store.dart';
import 'sub_components/empty_orders_tile/empty_orders_tile.dart';
import 'sub_components/order_tile/order_tile.dart';

class CurrentOrders extends StatefulWidget {
  const CurrentOrders({super.key});
  @override
  State<CurrentOrders> createState() => _CurrentOrdersState();
}

class _CurrentOrdersState extends State<CurrentOrders> with Loader {
  final ordersStore = Modular.get<OrdersStore>();

  final requestsScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    effect(() {
      if (this.ordersStore.isLoading) {
        showLoader(
          title: 'Atualizando Pedidos',
          message:
              'Estamos atualizando a lista de pedidos. Por favor, aguarde um momento',
        );
      } else {
        hideLoader();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.isDesktopXXlUP
          ? context.columnSize10
          : context.isDesktopLgUP
              ? context.columnSize9
              : context.columnSize8,
      child: Watch(
        (_) {
          return Visibility(
            visible: ordersStore.orders.value.isNotEmpty,
            replacement: const EmptyOrdersTile(),
            child: SingleChildScrollView(
              controller: requestsScrollController,
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: this.ordersStore.orders.value.map((order) {
                  return OrderTile(order: order);
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
