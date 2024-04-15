import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: SplashModule(),
      // guards: [SplashRouteGuard()],
    );
  }
}
