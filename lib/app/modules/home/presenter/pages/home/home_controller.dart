import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../shared/domain/entities/user/logged_user.dart';
import '../../../../../shared/utils/routes/app_routes.dart';
import '../../../../authentication/domain/usecases/logout/logout_interface.dart';
import '../../../../splash/presenter/stores/app_store/app_store.dart';
import '../../../../splash/presenter/stores/user_store/user_store.dart';

class HomeController extends Store<bool> {
  final UserStore _userStore;
  final AppStore _appStore;
  final ILogout _logout;

  HomeController({
    required UserStore userStore,
    required AppStore appStore,
    required ILogout logout,
  })  : _userStore = userStore,
        _appStore = appStore,
        _logout = logout,
        super(false);

  Future<void> loadingTest() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
  }

  String get displayName => _userStore.displayName;

  bool get isAdmin => _userStore.isAdmin;

  String get appVersion {
    return 'Versão ${_appStore.appInformations.version}+${_appStore.appInformations.buildNumber}';
  }

  Future<void> doLogout() async {
    final logoutResult = await _logout();
    logoutResult.fold(
      (result) {
        _userStore.setNewUser(LoggedUser.empty());
        setLoading(false);
        Modular.to.pushReplacementNamed('${AppRoutes.authentication}/');
      },
      (failure) {
        setError(failure);
        setLoading(false);
      },
    );
  }

  void pushRegisterCode() {
    Modular.to.pushNamed(
      '${AppRoutes.home}${AppRoutes.registerBarcode}',
    );
  }

  void pushOrdersPage() {
    Modular.to.pushNamed(
      '${AppRoutes.home}${AppRoutes.orders}',
    );
  }
}
