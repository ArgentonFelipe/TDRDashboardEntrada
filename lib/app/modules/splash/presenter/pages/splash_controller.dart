import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../shared/domain/usecases/get_app_info/get_app_info_interface.dart';
import '../../../../shared/domain/usecases/get_logged_user/get_logged_user_interface.dart';
import '../../../../shared/domain/usecases/get_service_address/get_service_address_interface.dart';
import '../../../../shared/domain/usecases/initialize_local_databases/initialize_local_databases_interface.dart';
import '../../../../shared/presenter/stores/service_address_store/service_address_store.dart';
import '../../../../shared/utils/routes/app_routes.dart';
import '../stores/app_store/app_store.dart';
import '../stores/user_store/user_store.dart';

class SplashController extends Store<Unit> {
  final IGetAppInfo _getAppInfo;
  final IGetLoggedUser _getLoggedUser;
  final IGetServiceAddress _getServiceAddress;
  final IInitializeLocalDatabases _initializeLocalDatabases;

  final ServiceAddressStore _serviceAddressStore;
  final AppStore _appStore;
  final UserStore _userStore;

  SplashController({
    required IGetAppInfo getAppInfo,
    required IGetLoggedUser getLoggedUser,
    required IGetServiceAddress getServiceAddress,
    required IInitializeLocalDatabases initializeLocalDatabases,
    required ServiceAddressStore serviceAddressStore,
    required AppStore appStore,
    required UserStore userStore,
  })  : _getAppInfo = getAppInfo,
        _initializeLocalDatabases = initializeLocalDatabases,
        _getLoggedUser = getLoggedUser,
        _getServiceAddress = getServiceAddress,
        _serviceAddressStore = serviceAddressStore,
        _appStore = appStore,
        _userStore = userStore,
        super(unit);

  Future<void> init() async {
    setLoading(true);
    await _initializeLocalDatabases();
    await getConfigurations();
  }

  Future<void> getConfigurations() async {
    final getResult = await _getServiceAddress();
    getResult.fold(
      (configurations) async {
        _serviceAddressStore.setServiceAddress(configurations);
        await getAppInformations();
      },
      (failure) {
        setError(failure);
        setLoading(false);
      },
    );
  }

  Future<void> getAppInformations() async {
    final appInfo = await _getAppInfo();
    appInfo.fold(
      (newAppInformations) async {
        _appStore.setNewAppInformtions(newAppInformations: newAppInformations);
        await getUser();
      },
      (newFailure) {
        setError(newFailure);
        setLoading(false);
      },
    );
  }

  Future<void> getUser() async {
    final loggedUserResult = await _getLoggedUser();
    loggedUserResult.fold(
      (user) {
        setLoading(false);
        _userStore.setNewUser(user);
        Modular.to.pushReplacementNamed('${AppRoutes.home}/');
      },
      (newFailure) {
        setError(newFailure);
        setLoading(false);
        Modular.to.pushReplacementNamed('${AppRoutes.authentication}/');
      },
    );
  }
}
