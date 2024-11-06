import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'TDR Dashboard Entrada',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.darkRedTheme,
    );
  }
}
