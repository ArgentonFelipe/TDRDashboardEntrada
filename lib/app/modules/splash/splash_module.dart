import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/shared_module.dart';
import '../../shared/utils/routes/app_routes.dart';
import '../authentication/authentication_module.dart';
// import '../home/home_module.dart';
// import '../settings/settings_module.dart';
import '../home/home_module.dart';
import 'presenter/components/alert_dialog_device_configurations/alert_dialog_device_configurations_controller.dart';
import 'presenter/pages/splash_controller.dart';
import 'presenter/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) {
    //? CONTROLLERS
    i.addLazySingleton<SplashController>(SplashController.new);
    i.addLazySingleton<AlertDialogServiceAddressController>(
      AlertDialogServiceAddressController.new,
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const SplashPage());
    r.module(AppRoutes.authentication, module: AuthenticationModule());
    r.module(AppRoutes.home, module: HomeModule());
    // r.module(AppRoutes.settings, module: SettingsModule());
  }
}
