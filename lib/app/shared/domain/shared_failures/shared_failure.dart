import 'package:equatable/equatable.dart';

import '../../utils/default_failure_messages/default_failure_messages.dart';
import '../../utils/random_generators/string_random_generator.dart';

abstract interface class ISharedFailure implements Exception {
  final String id;
  final String? message;

  ISharedFailure({required this.id, this.message});
}

class OfflineDeviceFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message = DefaultFailureMessages.deviceOffline;

  OfflineDeviceFailure();

  @override
  List<Object> get props => [id];
}

class LocalStorageFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  LocalStorageFailure({this.message});
  @override
  List<Object> get props => [id];
}

class SharedRestRepositoryFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  SharedRestRepositoryFailure({this.message});
  @override
  List<Object> get props => [id];
}

class SharedRestDatasourceFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  SharedRestDatasourceFailure({this.message});
  @override
  List<Object> get props => [id];
}

class SetCommonDataFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  SetCommonDataFailure({this.message});
  @override
  List<Object> get props => [id];
}

class SharedUserLocalDatasourceFailure extends Equatable
    implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  SharedUserLocalDatasourceFailure({this.message});
  @override
  List<Object> get props => [id];
}

class BadOrderFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  BadOrderFailure({this.message});
  @override
  List<Object> get props => [id];
}

class UnauthenticatedFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  UnauthenticatedFailure({this.message});
  @override
  List<Object> get props => [id];
}

class ForbiddenFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  ForbiddenFailure({this.message});
  @override
  List<Object> get props => [id];
}

class DefaultErrorCodeFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  DefaultErrorCodeFailure({this.message});
  @override
  List<Object> get props => [id];
}

class DeviceServiceFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  DeviceServiceFailure({this.message});
  @override
  List<Object> get props => [id];
}

class AppServiceFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  AppServiceFailure({this.message});
  @override
  List<Object> get props => [id];
}

class GetAppInfoFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  GetAppInfoFailure({this.message});
  @override
  List<Object> get props => [id];
}

class GetAppVersionFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  GetAppVersionFailure({this.message});
  @override
  List<Object> get props => [id];
}

class OutdatedAppFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  OutdatedAppFailure({this.message});
  @override
  List<Object> get props => [id];
}

class SplashRestRepositoryFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  SplashRestRepositoryFailure({this.message});
  @override
  List<Object> get props => [id];
}

class GetLoggedUserFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  GetLoggedUserFailure({this.message});
  @override
  List<Object> get props => [id];
}

class DefaultSplashFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  DefaultSplashFailure({this.message});
  @override
  List<Object> get props => [id];
}

class DeviceConfigurationsRepositoryFailure extends Equatable
    implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  DeviceConfigurationsRepositoryFailure({this.message});
  @override
  List<Object> get props => [id];
}

class DeviceConfigurationsDatasourceFailure extends Equatable
    implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  DeviceConfigurationsDatasourceFailure({this.message});
  @override
  List<Object> get props => [id];
}

class EmptyDeviceConfigurationsFailure extends Equatable
    implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  EmptyDeviceConfigurationsFailure({this.message});

  @override
  List<Object> get props => [id];
}

class SaveServiceAddressFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  SaveServiceAddressFailure({this.message});

  @override
  List<Object> get props => [id];
}

class ServiceAddressLocalRepositoryFailure extends Equatable
    implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  ServiceAddressLocalRepositoryFailure({this.message});

  @override
  List<Object> get props => [id];
}

class ServiceAddressLocalDatasourceFailure extends Equatable
    implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  ServiceAddressLocalDatasourceFailure({this.message});

  @override
  List<Object> get props => [id];
}

class SetServiceAddressFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  SetServiceAddressFailure({this.message});

  @override
  List<Object> get props => [id];
}

class UserLocalDatasourceFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  UserLocalDatasourceFailure({this.message});

  @override
  List<Object> get props => [id];
}

class ServiceAddressRepositoryFailure extends Equatable
    implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  ServiceAddressRepositoryFailure({this.message});

  @override
  List<Object> get props => [id];
}

class EmptyUserFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  EmptyUserFailure({this.message});

  @override
  List<Object> get props => [id];
}

class BarcodeServiceFailure extends Equatable implements ISharedFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  BarcodeServiceFailure({this.message});

  @override
  List<Object> get props => [id];
}
