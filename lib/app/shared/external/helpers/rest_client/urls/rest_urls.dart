class RestURLs {
  static const String orderStillInSeparation = '/ping';

  static const String _entry = '/entry';
  static const String _product = '/product';
  static const String entryCheckout = '$_entry/checkout';
  static const String stockEntry = '$_entry/stock';
  static const String getEmployees = '$_entry/employees';
  static const String getOrderHeaders = '$_entry/get_entries';
  static const String returnOrderToQueue = '$_entry/return_to_queue';
  static const String linkOrderWithEmployee = '$_entry/link_entry_employee';

  static const String barcode = '$_product/barcode';
}
