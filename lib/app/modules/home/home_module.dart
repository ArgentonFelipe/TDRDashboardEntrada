import 'package:flutter_modular/flutter_modular.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../shared/utils/app_routes/app_routes.dart';
import '../conference/conference_module.dart';
import 'presenter/pages/menu/menu_controller.dart';
import 'presenter/pages/menu/menu_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    //? CONTROLLERS
    i.addLazySingleton<MenuController>(MenuController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.menu, child: (_) => const MenuPage());
    r.module(AppRoutes.conference, module: ConferenceModule());
  }
}
