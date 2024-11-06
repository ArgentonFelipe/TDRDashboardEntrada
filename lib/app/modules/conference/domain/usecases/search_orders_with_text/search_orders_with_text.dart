import '../../entities/order/order.dart';
import 'search_orders_with_text_interface.dart';

class SearchOrdersWithText implements ISearchOrdersWithText {
  @override
  List<Order> call({required List<Order> orders, required String text}) {
    final localOrders = List<Order>.from(orders);
    return localOrders.where((order) {
      return order.employeeName.toLowerCase().contains(text.toLowerCase()) ||
          order.supplierName.toLowerCase().contains(text.toLowerCase()) ||
          order.orderNumber.toString().contains(text);
    }).toList();
  }
}
