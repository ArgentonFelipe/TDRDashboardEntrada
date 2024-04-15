import 'package:package_info_plus/package_info_plus.dart';

import 'package_info_wrapper_interface.dart';

class PackageInfoWrapper implements IPackageInfoWrapper {
  late final PackageInfo _packageInfo;

  PackageInfoWrapper() {
    init();
  }

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  String get version => _packageInfo.version;

  @override
  String get buildNumber => _packageInfo.buildNumber;

  @override
  String get packageName => _packageInfo.packageName;

  @override
  String get appName => _packageInfo.appName;
}
