import 'package:result_dart/result_dart.dart';

import '../../entities/employee/employee.dart';
import '../../failures/home_failures.dart';

abstract interface class IGetEmployees {
  Future<Result<List<Employee>, IHomeFailure>> call();
}
