import '../../entities/order/order.dart';

abstract class ISearchOrdersWithText {
  List<Order> call({
    required List<Order> orders,
    required String text,
  });
}
