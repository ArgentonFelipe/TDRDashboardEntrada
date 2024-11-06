import 'package:equatable/equatable.dart';

import 'box_fields_name/box_fields_name.dart';

class Box extends Equatable {
  final String boxId;
  final int orderId;

  const Box({
    required this.boxId,
    required this.orderId,
  });

  @override
  List<Object?> get props => [boxId, orderId];

  factory Box.mapToObject(Map<String, dynamic> map) {
    return Box(
      boxId: map[BoxFieldsName.boxId]?.toString() ?? '',
      orderId: map[BoxFieldsName.orderId] ?? 0,
    );
  }

  Map<String, dynamic> objectToMap() {
    return {
      BoxFieldsName.boxId: boxId,
      BoxFieldsName.orderId: orderId,
    };
  }
}
