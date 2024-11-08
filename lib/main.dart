import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
