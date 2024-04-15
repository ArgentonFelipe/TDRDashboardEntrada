import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/user/logged_user.dart';
import '../../../domain/repositories/user_local_repository_interface.dart';
import '../../../domain/shared_failures/shared_failure.dart';
import '../../../utils/default_failure_messages/default_failure_messages.dart';
import '../../helpers/hive/user_hive_model/user_hive_model.dart';

class UserLocalRepository implements IUserLocalRepository {
  static const _userKey = 'local_user_key';
  static const _boxKey = 'local_user_box_key';

  UserLocalRepository();

  @override
  Future<Result<Unit, ISharedFailure>> init() async {
    try {
      await Hive.initFlutter();
      if (!Hive.isAdapterRegistered(UserHiveModelAdapter().typeId)) {
        Hive.registerAdapter(UserHiveModelAdapter());
      }
      return const Success(unit);
    } on HiveError catch (hiveError) {
      return Failure(
        ServiceAddressLocalRepositoryFailure(
          message: hiveError.message,
        ),
      );
    }
  }

  @override
  Future<Result<LoggedUser, ISharedFailure>> getLoggedUser() async {
    try {
      final userBox = await Hive.openBox<UserHiveModel>(_boxKey);

      final userModel = userBox.get(_userKey);

      return userModel != null
          ? Success(LoggedUser.mapToObject(userModel.objectToMap()))
          : Failure(EmptyUserFailure());
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
  Future<Result<Unit, ISharedFailure>> logout() async {
    try {
      final userBox = await Hive.openBox<UserHiveModel>(_boxKey);
      final userModel = userBox.get(_userKey);
      if (userModel != null) {
        await userModel.delete();
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
  Future<Result<Unit, ISharedFailure>> saveLoggedUser(
    LoggedUser loggedUser,
  ) async {
    try {
      final userBox = await Hive.openBox<UserHiveModel>(_boxKey);
      await userBox.put(
        _userKey,
        UserHiveModel.mapToObject(loggedUser.objectToMap()),
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
