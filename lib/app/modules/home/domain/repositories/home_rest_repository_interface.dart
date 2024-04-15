import 'package:result_dart/result_dart.dart';

import '../entities/employee/employee.dart';
import '../failures/home_failures.dart';

abstract interface class IHomeRestRepository {
  // Future<Result<Order, IHomeFailure>> getOrder({required int userId});
  // Future<Result<Product, IHomeFailure>> searchProduct({
  //   required int userId,
  //   required int productCode,
  // });

  // Future<Result<Unit, IHomeFailure>> registerBarcode({
  //   required int userId,
  //   required Product product,
  //   required String barcode,
  //   required bool isEAN13,
  // });

  Future<Result<List<Employee>, IHomeFailure>> getEmployees();
  // Future<Result<List<OrderHeader>, IHomeFailure>> getOrderHeaders();
  // Future<Result<Unit, IHomeFailure>> linkOrderWithEmployee({
  //   required OrderHeader orderHeader,
  //   required List<Employee> employees,
  // });
}
