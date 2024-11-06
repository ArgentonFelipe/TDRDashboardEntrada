import 'package:result_dart/result_dart.dart';

import '../../entities/order/order.dart';
import '../../failures/failures.dart';

abstract class IGetOrders {
  Future<Result<List<Order>, IConferenceFailure>> call();
}
