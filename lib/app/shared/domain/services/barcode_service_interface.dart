import 'package:result_dart/result_dart.dart';

import '../shared_failures/shared_failure.dart';

abstract interface class IBarcodeService {
  Result<Stream, ISharedFailure> listenBarcodes();
}
