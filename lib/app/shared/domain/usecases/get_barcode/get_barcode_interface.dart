import 'package:result_dart/result_dart.dart';

import '../../shared_failures/shared_failure.dart';

abstract interface class IGetBarcode {
  Result<Stream, ISharedFailure> call();
}
