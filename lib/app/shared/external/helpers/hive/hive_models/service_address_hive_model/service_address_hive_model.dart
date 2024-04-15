import 'package:hive/hive.dart';

import '../../../../../domain/entities/service_address/service_address_fields_name/service_address_fields_name.dart';

part 'service_address_hive_model.g.dart';

@HiveType(typeId: 3, adapterName: 'ServiceAddressHiveAdapter')
class ServiceAddressHiveModel extends HiveObject {
  @HiveField(1)
  String ipAddress;

  @HiveField(2)
  int port;

  ServiceAddressHiveModel({
    required this.ipAddress,
    required this.port,
  });

  factory ServiceAddressHiveModel.mapToObject(Map<String, dynamic> map) {
    return ServiceAddressHiveModel(
      ipAddress: map[ServiceAddressFieldsName.ipAddress],
      port: map[ServiceAddressFieldsName.port],
    );
  }

  Map<String, dynamic> objectToMap() {
    return {
      ServiceAddressFieldsName.ipAddress: ipAddress,
      ServiceAddressFieldsName.port: port,
    };
  }
}
