import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/shared_module.dart';
import 'domain/repositories/authentication_repository_interface.dart';
import 'domain/usecases/login_with_username_and_password/login_with_username_and_password.dart';
import 'domain/usecases/login_with_username_and_password/login_with_username_and_password_interface.dart';
import 'external/repositories/authentication_repository.dart';
import 'presenter/pages/authentication/authentication_controller.dart';
import 'presenter/pages/authentication/authentication_page.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(Injector i) {
    //? CONTROLLERS
    i.addLazySingleton<AuthenticationController>(AuthenticationController.new);

    //? USECASES
    i.addLazySingleton<ILoginWithUsernameAndPassword>(
      LoginWithUsernameAndPassword.new,
    );

    //? REPOSITORIES
    i.addLazySingleton<IAuthenticationRepository>(AuthenticationRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const AuthenticationPage());
  }
}
