import '../../entities/order/order.dart';
import 'filter_local_orders_interface.dart';

class FilterLocalOrders implements IFilterLocalOrders {
  @override
  List<Order> call({
    required List<Order> orders,
    required int filterLocal,
  }) {
    const shippingCompanyExpedition = [1, 20, 21];
    final filteredOrders = List<Order>.from(orders);
    // if (filterLocal == 1) {
    //   filteredOrders.retainWhere(
    //     (order) {
    //       return shippingCompanyExpedition.contains(order.shippingCompanyId);
    //     },
    //   );
    //   return filteredOrders;
    // } else if (filterLocal == 2) {
    //   filteredOrders.removeWhere(
    //     (order) {
    //       return shippingCompanyExpedition.contains(order.shippingCompanyId);
    //     },
    //   );
    //   return filteredOrders;
    // } else {
    return orders;
    // }
  }
}
