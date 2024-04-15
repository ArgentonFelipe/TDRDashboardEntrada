import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../shared/domain/entities/user/login_credential.dart';
import '../../../../../shared/utils/routes/app_routes.dart';
import '../../../../splash/presenter/stores/app_store/app_store.dart';
import '../../../../splash/presenter/stores/user_store/user_store.dart';
import '../../../domain/usecases/login_with_username_and_password/login_with_username_and_password_interface.dart';

class AuthenticationController extends Store<Unit> {
  final ILoginWithUsernameAndPassword _loginWithUsernameAndPassword;
  final UserStore _userStore;
  final AppStore _appStore;

  AuthenticationController({
    required ILoginWithUsernameAndPassword loginWithUsernameAndPassword,
    required UserStore userStore,
    required AppStore appStore,
  })  : _loginWithUsernameAndPassword = loginWithUsernameAndPassword,
        _userStore = userStore,
        _appStore = appStore,
        super(unit);

  String get appVersion {
    return 'Versão ${_appStore.appInformations.version}+${_appStore.appInformations.buildNumber}';
  }

  Future<void> doLogin(LoginCredential loginCredential) async {
    setLoading(true);
    final loginResult = await _loginWithUsernameAndPassword(
      loginCredential: loginCredential,
    );
    loginResult.fold(
      (userResult) {
        _userStore.setNewUser(userResult);
        setLoading(false);
        Modular.to.pushReplacementNamed(AppRoutes.home);
      },
      (failure) {
        setError(failure);
        setLoading(false);
      },
    );
  }

  void pushSettings() {
    Modular.to.pushNamed('${AppRoutes.settings}/');
  }
}
