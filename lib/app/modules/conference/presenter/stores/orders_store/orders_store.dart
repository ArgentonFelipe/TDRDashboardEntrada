import 'package:signals_flutter/signals_flutter.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../domain/entities/order/order.dart';
import '../../../domain/enum/conference_status/conference_status.dart';
import '../../../domain/usecases/filter_local_orders/filter_local_orders_interface.dart';
import '../../../domain/usecases/filter_order_status/filter_order_status_interface.dart';
import '../../../domain/usecases/get_orders/get_orders_interface.dart';
import '../../../domain/usecases/search_orders_with_text/search_orders_with_text_interface.dart';
import '../conference_status_filter_store/conference_status_filter_store.dart';
import '../local_filter_store/local_filter_store.dart';

class OrdersStore with MessageStateMixin {
  final ConferenceStatusFilterStore _conferenceStatusFilterStore;
  final LocalFilterStore _localFilterStore;

  final IGetOrders _getOrders;
  final IFilterOrderStatus _filterOrderStatus;
  final IFilterLocalOrders _filterLocalOrders;
  final ISearchOrdersWithText _searchOrdersWithText;
  final AppInfoStore _appInfoStore;

  OrdersStore({
    required IGetOrders getOrders,
    required LocalFilterStore localFilterStore,
    required IFilterLocalOrders filterLocalOrders,
    required ConferenceStatusFilterStore conferenceStatusFilterStore,
    required IFilterOrderStatus filterOrderStatus,
    required ISearchOrdersWithText searchOrdersWithText,
    required AppInfoStore appInfoStore,
  })  : _localFilterStore = localFilterStore,
        _filterLocalOrders = filterLocalOrders,
        _conferenceStatusFilterStore = conferenceStatusFilterStore,
        _filterOrderStatus = filterOrderStatus,
        _getOrders = getOrders,
        _appInfoStore = appInfoStore,
        _searchOrdersWithText = searchOrdersWithText;

  String get version => _appInfoStore.version;

  // Future<void> getAppVersion() async => await _appInfoStore.getAppVersion();

  late final orders = computed(
    () => applyAllFilters(),
  );

  final _isLoading = signal<bool>(false);

  final _localOrders = listSignal<Order>([]);
  final _searchText = signal<String>('');

  bool get isLoading => _isLoading.value;

  void setLoading(bool isLoading) => _isLoading.value = isLoading;

  int get notBeginingQuantity {
    return _localOrders
        .where(
          (order) => order.conferenceStatus == ConferenceStatus.notBegining,
        )
        .length;
  }

  int get inConferenceQuantity {
    return _localOrders
        .where(
          (order) => order.conferenceStatus == ConferenceStatus.inConference,
        )
        .length;
  }

  int get conferedOrdersQuantity {
    return _localOrders
        .where((order) => order.conferenceStatus == ConferenceStatus.confered)
        .length;
  }

  int get separatedByCellphoneQuantity {
    return _localOrders
        .where((order) => order.conferenceType == 'Coletor')
        .length;
  }

  int get separatedByPaperQuantity {
    return _localOrders
        .where((order) => order.conferenceType == 'TDRConfereE')
        .length;
  }

  List<Order> applyAllFilters() {
    final filterResult = _filterOrderStatus(
      orders: _localOrders(),
      orderStateFilter: _conferenceStatusFilterStore.conferenceStatus,
    );

    final newOrders = _searchOrdersWithText(
      orders: filterResult,
      text: _searchText(),
    );

    return newOrders;
  }

  void searchWithText(String text) {
    _searchText.value = text;
  }

  Future<void> getAllOrders() async {
    setLoading(true);

    final getOrdersResult = await _getOrders();

    getOrdersResult.fold(
      (orders) {
        _localOrders.clear();
        _localOrders.addAll(orders);
      },
      (failure) {
        showError(failure.message ?? DefaultFailureMessages.error);
      },
    );
    setLoading(false);
  }
}
