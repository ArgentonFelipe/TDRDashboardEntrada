import '../../../../../shared/domain/entities/app_informations/app_informations.dart';

class AppStore {
  static AppStore? _instance;
  // Avoid self instance
  AppStore._();
  static AppStore get instance => _instance ??= AppStore._();
  AppInformations appInformations = const AppInformations(
    buildNumber: '',
    version: '',
    packageName: '',
  );

  void setNewAppInformtions({required AppInformations newAppInformations}) {
    appInformations = newAppInformations;
  }
}
