import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/shared_module.dart';
import 'domain/repositories/home_rest_repository_interface.dart';
import 'domain/usecases/get_employess/get_employees.dart';
import 'domain/usecases/get_employess/get_employees_interface.dart';
import 'external/repositories/home_rest_repository.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/stores/opened_employees/opened_employees_store.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) {
    //? CONTROLLERS
    i.addLazySingleton<HomeController>(HomeController.new);

    //? USECASES
    i.addLazySingleton<IGetEmployees>(GetEmployees.new);

    //? REPOSITORIES
    i.addLazySingleton<IHomeRestRepository>(HomeRestRepository.new);

    //? STORES
    i.addLazySingleton<OpenedEmployeesStore>(OpenedEmployeesStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const HomePage());
  }
}
