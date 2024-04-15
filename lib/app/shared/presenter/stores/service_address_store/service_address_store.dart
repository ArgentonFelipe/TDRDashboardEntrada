import '../../../domain/entities/service_address/service_address.dart';

class ServiceAddressStore {
  static ServiceAddressStore? _instance;

  ServiceAddressStore._();
  static ServiceAddressStore get instance {
    return _instance ??= ServiceAddressStore._();
  }

  ServiceAddress _serviceAddress = ServiceAddress.empty();

  void setServiceAddress(ServiceAddress serviceAddress) {
    _serviceAddress = serviceAddress;
  }

  String get ip => _serviceAddress.ipAddress;

  String get port => _serviceAddress.port.toString();
}
