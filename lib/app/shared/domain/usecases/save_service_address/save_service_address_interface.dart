import 'package:result_dart/result_dart.dart';

import '../../entities/service_address/service_address.dart';
import '../../shared_failures/shared_failure.dart';

abstract interface class ISaveServiceAddress {
  Future<Result<Unit, ISharedFailure>> call(
    ServiceAddress serviceAddress,
  );
}
