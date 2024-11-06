import 'package:signals_flutter/signals_flutter.dart';

import '../../../domain/entities/order_state_filter/order_state_filter.dart';

class ConferenceStatusFilterStore {
  ConferenceStatusFilterStore();

  final _conferenceStatus = Signal<OrderStateFilter>(OrderStateFilter.empty());

  OrderStateFilter get conferenceStatus => _conferenceStatus.value;

  OrderStateFilter get status => _conferenceStatus.value;

  void changeConferedFlag(newConferedFlag) {
    _conferenceStatus.value = _conferenceStatus.value.copyWith(
      canShowConfered: newConferedFlag,
    );
  }

  void changeInConferenceFlag(inConferenceFlag) {
    _conferenceStatus.value = _conferenceStatus.value.copyWith(
      canShowInConference: inConferenceFlag,
    );
  }

  void changeNotBeginingFlag(notBeginingFlag) {
    _conferenceStatus.value = _conferenceStatus.value.copyWith(
      canShowNotBegining: notBeginingFlag,
    );
  }

  void cleanFilter() {
    _conferenceStatus.value = OrderStateFilter.empty();
  }
}
