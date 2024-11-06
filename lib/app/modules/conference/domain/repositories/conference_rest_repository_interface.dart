import 'package:result_dart/result_dart.dart';

import '../entities/order/order.dart';
import '../failures/failures.dart';

abstract class IConferenceRestRepository {
  Future<Result<List<Order>, IConferenceFailure>> getOrders();
}
