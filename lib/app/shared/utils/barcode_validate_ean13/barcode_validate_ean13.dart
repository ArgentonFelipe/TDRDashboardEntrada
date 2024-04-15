import 'barcode_validate_ean13_interface.dart';

class BarcodeValidateEAN13 implements IValidateBarcodeEAN13 {
  @override
  bool isValid(String barcode) {
    if (barcode.isEmpty || barcode.length != 13) {
      return false;
    }
    final lastIndex = barcode.length - 1;

    final checkDigit = int.tryParse(barcode[lastIndex]);
    if (checkDigit == null) {
      return false;
    }

    final firstDigit = int.tryParse(barcode[0]);
    if (firstDigit == null) return false;
    final secondDigit = int.tryParse(barcode[1]);
    if (secondDigit == null) return false;
    final thirdDigit = int.tryParse(barcode[2]);
    if (thirdDigit == null) return false;
    final fourthDigit = int.tryParse(barcode[3]);
    if (fourthDigit == null) return false;
    final fifthDigit = int.tryParse(barcode[4]);
    if (fifthDigit == null) return false;
    final sixthDigit = int.tryParse(barcode[5]);
    if (sixthDigit == null) return false;
    final seventhDigit = int.tryParse(barcode[6]);
    if (seventhDigit == null) return false;
    final eighthDigit = int.tryParse(barcode[7]);
    if (eighthDigit == null) return false;
    final ninthDigit = int.tryParse(barcode[8]);
    if (ninthDigit == null) return false;
    final tenthDigit = int.tryParse(barcode[9]);
    if (tenthDigit == null) return false;
    final eleventhDigit = int.tryParse(barcode[10]);
    if (eleventhDigit == null) return false;
    final twelfthDigit = int.tryParse(barcode[11]);
    if (twelfthDigit == null) return false;

    final evenSum = secondDigit +
        fourthDigit +
        sixthDigit +
        eighthDigit +
        tenthDigit +
        twelfthDigit;

    final totalEvenSum = evenSum * 3;

    final oddSum = firstDigit +
        thirdDigit +
        fifthDigit +
        seventhDigit +
        ninthDigit +
        eleventhDigit;

    final finalSum = totalEvenSum + oddSum;

    int checkSum = finalSum % 10;
    if (checkSum != 0) {
      checkSum = 10 - checkSum;
    }

    if (checkSum == checkDigit) {
      return true;
    }

    return false;
  }
}
