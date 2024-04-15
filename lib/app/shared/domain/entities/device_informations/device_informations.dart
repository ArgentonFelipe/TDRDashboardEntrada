import 'package:equatable/equatable.dart';

class DeviceInformations extends Equatable {
  final String deviceId;

  bool get isInvalidDeviceID => deviceId.isEmpty;

  const DeviceInformations({
    required this.deviceId,
  });

  @override
  List<Object?> get props => [deviceId];
}
