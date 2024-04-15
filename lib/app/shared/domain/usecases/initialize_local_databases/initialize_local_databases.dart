import 'package:result_dart/result_dart.dart';

import '../../repositories/service_address_repository_interface.dart';
import '../../repositories/user_local_repository_interface.dart';
import 'initialize_local_databases_interface.dart';

class InitializeLocalDatabases implements IInitializeLocalDatabases {
  final IUserLocalRepository _userLocalRepository;
  final IServiceAddressRepository _serviceAddressRepository;

  InitializeLocalDatabases({
    required IServiceAddressRepository serviceAddressRepository,
    required IUserLocalRepository userLocalRepository,
  })  : _userLocalRepository = userLocalRepository,
        _serviceAddressRepository = serviceAddressRepository;

  @override
  Future<Unit> call() async {
    await Future.wait(
      [
        _userLocalRepository.init(),
        _serviceAddressRepository.init(),
      ],
      eagerError: true,
    );

    return unit;
  }
}
