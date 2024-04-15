import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../modules/authentication/domain/usecases/logout/logout.dart';
import '../modules/authentication/domain/usecases/logout/logout_interface.dart';
import '../modules/splash/presenter/stores/app_store/app_store.dart';
import '../modules/splash/presenter/stores/user_store/user_store.dart';
import 'domain/repositories/service_address_repository_interface.dart';
import 'domain/repositories/user_local_repository_interface.dart';
import 'domain/services/app_service_interface.dart';
import 'domain/services/connectivity_service_interface.dart';
import 'domain/usecases/get_app_info/get_app_info.dart';
import 'domain/usecases/get_app_info/get_app_info_interface.dart';
import 'domain/usecases/get_barcode/get_barcode.dart';
import 'domain/usecases/get_barcode/get_barcode_interface.dart';
import 'domain/usecases/get_logged_user/get_logged_user.dart';
import 'domain/usecases/get_logged_user/get_logged_user_interface.dart';
import 'domain/usecases/get_service_address/get_service_address.dart';
import 'domain/usecases/get_service_address/get_service_address_interface.dart';
import 'domain/usecases/initialize_local_databases/initialize_local_databases.dart';
import 'domain/usecases/initialize_local_databases/initialize_local_databases_interface.dart';
import 'domain/usecases/save_service_address/save_service_address.dart';
import 'domain/usecases/save_service_address/save_service_address_interface.dart';
import 'external/helpers/package_info_wrapper/package_info_wrapper.dart';
import 'external/helpers/package_info_wrapper/package_info_wrapper_interface.dart';
import 'external/helpers/platform_wrapper/platform_wrapper.dart';
import 'external/helpers/platform_wrapper/platform_wrapper_interface.dart';
import 'external/helpers/rest_client/dio_rest_client/rest_client_dio.dart';
import 'external/helpers/rest_client/interfaces/rest_client_interface.dart';
import 'external/repositories/service_address_repository/service_address_repository.dart';
import 'external/repositories/user_local_repository/user_local_repository.dart';
import 'external/services/app_service.dart';
import 'external/services/connectivity_service.dart';
import 'presenter/stores/service_address_store/service_address_store.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    //? USECASES
    i.addLazySingleton<IGetAppInfo>(GetAppInfo.new);
    i.addLazySingleton<IGetServiceAddress>(GetServiceAddress.new);
    i.addLazySingleton<ISaveServiceAddress>(SaveServiceAddress.new);
    i.addLazySingleton<IGetLoggedUser>(GetLoggedUser.new);
    i.addSingleton<IInitializeLocalDatabases>(InitializeLocalDatabases.new);
    i.addLazySingleton<ILogout>(Logout.new);
    i.addLazySingleton<IGetBarcode>(GetBarcode.new);

    //? REPOSITORIES
    i.addSingleton<IServiceAddressRepository>(ServiceAddressRepository.new);
    i.addSingleton<IUserLocalRepository>(UserLocalRepository.new);

    //? PLUGINS
    i.addLazySingleton<Connectivity>(Connectivity.new);

    //? HELPERS
    i.addSingleton<IRestClient>(RestClientDio.new);
    i.addSingleton<IPlatformWrapper>(PlatformWrapper.new);
    i.addSingleton<IPackageInfoWrapper>(PackageInfoWrapper.new);

    //? SERVICES
    i.addSingleton<IAppService>(AppService.new);
    i.addSingleton<IConnectivityService>(ConnectivityService.new);

    //? STORES
    i.addInstance<UserStore>(UserStore.instance);
    i.addInstance<AppStore>(AppStore.instance);
    i.addInstance<ServiceAddressStore>(ServiceAddressStore.instance);
  }
}
