import 'package:result_dart/result_dart.dart';

import '../entities/user/logged_user.dart';
import '../shared_failures/shared_failure.dart';

abstract interface class IUserLocalRepository {
  Future<Result<Unit, ISharedFailure>> init();
  Future<Result<LoggedUser, ISharedFailure>> getLoggedUser();
  Future<Result<Unit, ISharedFailure>> saveLoggedUser(
    LoggedUser loggedUser,
  );
  Future<Result<Unit, ISharedFailure>> logout();
}
