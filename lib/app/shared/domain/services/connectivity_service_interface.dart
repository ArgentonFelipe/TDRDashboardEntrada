import 'package:result_dart/result_dart.dart';

import '../shared_failures/shared_failure.dart';

abstract interface class IConnectivityService {
  Future<Result<Unit, ISharedFailure>> checkConnectivity();
}
