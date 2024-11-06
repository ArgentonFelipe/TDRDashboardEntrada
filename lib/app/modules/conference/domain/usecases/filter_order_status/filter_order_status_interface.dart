import '../../entities/order/order.dart';
import '../../entities/order_state_filter/order_state_filter.dart';

abstract class IFilterOrderStatus {
  List<Order> call({
    required List<Order> orders,
    required OrderStateFilter orderStateFilter,
  });
}
