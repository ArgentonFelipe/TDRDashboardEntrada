import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../shared/domain/shared_failures/shared_failure.dart';
import '../../../../shared/presenter/components/alert_dialog_info/alert_dialog_info.dart';
import '../../../../shared/presenter/components/app_logo/app_logo.dart';
import '../../../../shared/presenter/components/default_loading/default_loading.dart';
import '../../../../shared/utils/default_failure_messages/default_failure_messages.dart';
import '../../../../shared/utils/styles/colors_app/colors_app.dart';
import '../components/alert_dialog_device_configurations/alert_dialog_device_configurations.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final controller = Modular.get<SplashController>();
  late final Disposer disposer;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async {
      controller.init();
      disposer = controller.observer(
        onError: (error) async {
          if (error is EmptyDeviceConfigurationsFailure) {
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return const AlertDialogServiceAddress();
              },
            );
            await this.controller.getConfigurations();
          } else {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialogInfo(
                  title: 'Comportamento Inesperado',
                  description:
                      error.message ?? DefaultFailureMessages.errorMessage,
                  onPressed: this.controller.getConfigurations,
                );
              },
            );
          }
        },
      );
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: AppLogo()),
          SizedBox(height: 10),
          DefaultLoading(),
        ],
      ),
    );
  }
}
