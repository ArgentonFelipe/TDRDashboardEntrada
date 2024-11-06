import 'package:equatable/equatable.dart';

class OrderStateFilter extends Equatable {
  final bool canShowNotBegining;
  final bool canShowInConference;
  final bool canShowConfered;
  // final bool canShowNew;

  const OrderStateFilter({
    required this.canShowNotBegining,
    required this.canShowInConference,
    required this.canShowConfered,
  });

  @override
  List<Object?> get props => [
        canShowNotBegining,
        canShowInConference,
        canShowConfered,
        // canShowNew,
      ];

  factory OrderStateFilter.empty() {
    return OrderStateFilter(
      canShowConfered: true,
      canShowInConference: true,
      canShowNotBegining: true,
    );
  }
  OrderStateFilter copyWith({
    bool? canShowNotBegining,
    bool? canShowInConference,
    bool? canShowConfered,
  }) {
    return OrderStateFilter(
      canShowNotBegining: canShowNotBegining ?? this.canShowNotBegining,
      canShowInConference: canShowInConference ?? this.canShowInConference,
      canShowConfered: canShowConfered ?? this.canShowConfered,
    );
  }
}
