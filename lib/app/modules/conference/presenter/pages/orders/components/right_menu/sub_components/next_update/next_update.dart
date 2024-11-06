import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../../../../stores/orders_store/orders_store.dart';

class NextUpdate extends StatefulWidget {
  const NextUpdate({super.key});

  @override
  State<NextUpdate> createState() => _NextUpdateState();
}

class _NextUpdateState extends State<NextUpdate> {
  final ordersStore = Modular.get<OrdersStore>();

  late Timer _updateTimer;
  late int nextUpdateTimeInSeconds;
  static const _refreshTimeInSeconds = 30;

  @override
  void initState() {
    super.initState();
    startUpdateTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: Text(
              'Atualização a cada ${_refreshTimeInSeconds.toString()} s',
              style: TextStyleApp.title.copyWith(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  void startUpdateTimer() {
    // nextUpdateTimeInSeconds = _refreshTimeInSeconds;
    // _updateTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (nextUpdateTimeInSeconds > 0) {
    //     nextUpdateTimeInSeconds--;
    //   } else {
    //     nextUpdateTimeInSeconds = _refreshTimeInSeconds;
    //     ordersStore.getAllOrders();
    //   }
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    _updateTimer.cancel();
    super.dispose();
  }
}
