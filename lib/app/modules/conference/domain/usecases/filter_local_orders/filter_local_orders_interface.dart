import '../../entities/order/order.dart';

abstract class IFilterLocalOrders {
  List<Order> call({
    required List<Order> orders,
    required int filterLocal,
  });
}
