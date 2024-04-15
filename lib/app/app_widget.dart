import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/utils/default_strings/default_strings.dart';
import 'shared/utils/theme/theme_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      title: DefaultStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.theme,
    );
  }
}
