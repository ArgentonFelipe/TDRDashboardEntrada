import 'package:result_dart/result_dart.dart';

import '../entities/service_address/service_address.dart';
import '../shared_failures/shared_failure.dart';

abstract interface class IServiceAddressRepository {
  Future<Result<Unit, ISharedFailure>> init();
  Future<Result<ServiceAddress, ISharedFailure>> getServiceAddress();

  Future<Result<Unit, ISharedFailure>> saveDeviceConfigurations(
    ServiceAddress serviceAddress,
  );
}
