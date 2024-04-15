import 'package:equatable/equatable.dart';

import 'service_address_fields_name/service_address_fields_name.dart';

class ServiceAddress extends Equatable {
  final String ipAddress;
  final int port;

  const ServiceAddress({
    required this.ipAddress,
    required this.port,
  });

  ServiceAddress copyWith({
    String? ipAdress,
    int? port,
  }) {
    return ServiceAddress(
      ipAddress: ipAdress ?? ipAddress,
      port: port ?? this.port,
    );
  }

  factory ServiceAddress.mapToObject(Map<String, dynamic> map) {
    return ServiceAddress(
      ipAddress: map[ServiceAddressFieldsName.ipAddress],
      port: map[ServiceAddressFieldsName.port].toInt(),
    );
  }

  Map<String, dynamic> objectToMap() {
    return {
      ServiceAddressFieldsName.ipAddress: ipAddress,
      ServiceAddressFieldsName.port: port,
    };
  }

  @override
  List<Object> get props => [ipAddress, port];

  factory ServiceAddress.empty() {
    return const ServiceAddress(ipAddress: '', port: 0);
  }
}
