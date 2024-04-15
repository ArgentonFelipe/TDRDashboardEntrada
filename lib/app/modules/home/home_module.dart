import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/shared_module.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) {
    //? CONTROLLERS
    i.addLazySingleton<HomeController>(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
