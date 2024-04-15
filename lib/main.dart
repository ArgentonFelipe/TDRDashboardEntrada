import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

Future<void> main() async {
  // runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.to.addListener(() {
    debugPrint('Path: ${Modular.to.path}');
  });

  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(
    ModularApp(
      module: AppModule(), 
      child: const AppWidget(),
    ),
  );
  // }, (error, stack) {
  // FirebaseCrashlytics.instance.recordError(error, stack);
  // });
}
