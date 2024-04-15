import 'package:result_dart/result_dart.dart';

import '../../entities/service_address/service_address.dart';
import '../../repositories/service_address_repository_interface.dart';
import '../../shared_failures/shared_failure.dart';
import 'save_service_address_interface.dart';

class SaveServiceAddress implements ISaveServiceAddress {
  final IServiceAddressRepository _serviceAddressRepository;

  SaveServiceAddress({
    required IServiceAddressRepository serviceAddressRepository,
  }) : _serviceAddressRepository = serviceAddressRepository;

  @override
  Future<Result<Unit, ISharedFailure>> call(
    ServiceAddress serviceAddress,
  ) async {
    return await _serviceAddressRepository.saveDeviceConfigurations(
      serviceAddress,
    );
  }
}
