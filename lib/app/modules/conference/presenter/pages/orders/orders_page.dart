import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../stores/orders_store/orders_store.dart';
import 'components/current_orders/current_orders.dart';
import 'components/right_menu/right_menu.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with MessageViewMixin {
  final ordersStore = Modular.get<OrdersStore>();

  @override
  void initState() {
    super.initState();

    messageListener(ordersStore);

    scheduleMicrotask(() async {
      await Future.wait([
        // ordersStore.getAppVersion(),
        ordersStore.getAllOrders(),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.red,
      body: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentOrders(),
          RightMenu(),
        ],
      ),
    );
  }
}
