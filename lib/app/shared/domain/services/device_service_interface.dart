import 'package:result_dart/result_dart.dart';

import '../entities/device_informations/device_informations.dart';
import '../shared_failures/shared_failure.dart';

abstract interface class IDeviceService {
  Future<Result<DeviceInformations, ISharedFailure>> getDeviceInfo();
}
