import '../../entities/order/order.dart';
import '../../entities/order_state_filter/order_state_filter.dart';
import '../../enum/conference_status/conference_status.dart';
import 'filter_order_status_interface.dart';

class FilterOrderStatus implements IFilterOrderStatus {
  @override
  List<Order> call({
    required List<Order> orders,
    required OrderStateFilter orderStateFilter,
  }) {
    final filteredOrders = <Order>[];

    if (orderStateFilter.canShowConfered) {
      final conferedOrders = orders.where((order) {
        return order.conferenceStatus == ConferenceStatus.confered;
      }).toList();

      filteredOrders.addAll(conferedOrders);
    }

    if (orderStateFilter.canShowInConference) {
      final packedOrders = orders.where((order) {
        return order.conferenceStatus == ConferenceStatus.inConference;
      }).toList();
      filteredOrders.addAll(packedOrders);
    }

    if (orderStateFilter.canShowNotBegining) {
      final separatedOrders = orders.where((order) {
        return order.conferenceStatus == ConferenceStatus.notBegining;
      }).toList();
      filteredOrders.addAll(separatedOrders);
    }

    return filteredOrders;
  }
}
