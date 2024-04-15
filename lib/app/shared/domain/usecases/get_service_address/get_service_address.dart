import 'package:result_dart/result_dart.dart';

import '../../entities/service_address/service_address.dart';
import '../../repositories/service_address_repository_interface.dart';
import '../../shared_failures/shared_failure.dart';
import 'get_service_address_interface.dart';

class GetServiceAddress implements IGetServiceAddress {
  final IServiceAddressRepository _serviceAddressRepository;

  GetServiceAddress({
    required IServiceAddressRepository serviceAddressRepository,
  }) : _serviceAddressRepository = serviceAddressRepository;

  @override
  Future<Result<ServiceAddress, ISharedFailure>> call() async {
    return await _serviceAddressRepository.getServiceAddress();
  }
}
