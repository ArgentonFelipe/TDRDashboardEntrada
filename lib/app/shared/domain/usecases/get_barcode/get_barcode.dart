import 'package:result_dart/result_dart.dart';

import '../../services/barcode_service_interface.dart';
import '../../shared_failures/shared_failure.dart';
import 'get_barcode_interface.dart';

class GetBarcode implements IGetBarcode {
  final IBarcodeService barcodeService;

  const GetBarcode({required this.barcodeService});
  @override
  Result<Stream, ISharedFailure> call() {
    return barcodeService.listenBarcodes();
  }
}
