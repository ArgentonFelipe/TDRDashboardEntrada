import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/service_address/service_address.dart';
import '../../../domain/repositories/service_address_repository_interface.dart';
import '../../../domain/shared_failures/shared_failure.dart';
import '../../../utils/default_failure_messages/default_failure_messages.dart';
import '../../helpers/hive/hive_models/service_address_hive_model/service_address_hive_model.dart';

class ServiceAddressRepository implements IServiceAddressRepository {
  ServiceAddressRepository();

  static const _boxKey = 'device_configurations_box_key';
  static const _deviceConfigurationsKey = 'device_configurations_key';

  @override
  Future<Result<Unit, ISharedFailure>> init() async {
    try {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(ServiceAddressHiveAdapter().typeId)) {
        Hive.registerAdapter(ServiceAddressHiveAdapter());
      }
      return const Success(unit);
    } on TimeoutException {
      return Failure(
        ServiceAddressLocalRepositoryFailure(
          message: DefaultFailureMessages.timeoutMessage,
        ),
      );
    } on HiveError catch (hiveError) {
      return Failure(
        ServiceAddressLocalRepositoryFailure(
          message: hiveError.message,
        ),
      );
    }
  }

  @override
  Future<Result<ServiceAddress, ISharedFailure>> getServiceAddress() async {
    try {
      final box = await Hive.openBox<ServiceAddressHiveModel?>(_boxKey);

      final serviceAddressHive = box.get(
        _deviceConfigurationsKey,
      );

      if (serviceAddressHive == null) {
        return Failure(EmptyDeviceConfigurationsFailure());
      } else if (serviceAddressHive.ipAddress.isEmpty ||
          serviceAddressHive.port == 0) {
        return Failure(EmptyDeviceConfigurationsFailure());
      }

      return Success(
        ServiceAddress.mapToObject(
          serviceAddressHive.objectToMap(),
        ),
      );
    } on TimeoutException {
      return Failure(
        ServiceAddressLocalRepositoryFailure(
          message: DefaultFailureMessages.timeoutMessage,
        ),
      );
    } on HiveError catch (hiveError) {
      return Failure(
        ServiceAddressLocalRepositoryFailure(
          message: hiveError.message,
        ),
      );
    }
  }

  @override
  Future<Result<Unit, ISharedFailure>> saveDeviceConfigurations(
    ServiceAddress serviceAddress,
  ) async {
    try {
      final box = await Hive.openBox<ServiceAddressHiveModel?>(
        _boxKey,
      );

      final serviceAddressHive = ServiceAddressHiveModel.mapToObject(
        serviceAddress.objectToMap(),
      );

      await box.put(
        _deviceConfigurationsKey,
        serviceAddressHive,
      );
      return const Success(unit);
    } on TimeoutException {
      return Failure(
        ServiceAddressLocalRepositoryFailure(
          message: DefaultFailureMessages.timeoutMessage,
        ),
      );
    } on HiveError catch (hiveError) {
      return Failure(
        ServiceAddressLocalRepositoryFailure(
          message: hiveError.message,
        ),
      );
    }
  }
}
