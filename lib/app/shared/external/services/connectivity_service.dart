import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/services/connectivity_service_interface.dart';
import '../../domain/shared_failures/shared_failure.dart';

class ConnectivityService implements IConnectivityService {
  final Connectivity _connectivity;

  const ConnectivityService({
    required Connectivity connectivity,
  }) : _connectivity = connectivity;

  @override
  Future<Result<Unit, ISharedFailure>> checkConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    final isOnline = connectivityResult.any((result) {
      return result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet;
    });

    if (isOnline) {
      return const Success(unit);
    }

    return Failure(OfflineDeviceFailure());
  }
}
