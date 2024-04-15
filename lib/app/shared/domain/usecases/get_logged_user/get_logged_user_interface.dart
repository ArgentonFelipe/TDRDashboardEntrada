import 'package:result_dart/result_dart.dart';

import '../../entities/user/logged_user.dart';
import '../../shared_failures/shared_failure.dart';

abstract interface class IGetLoggedUser {
  Future<Result<LoggedUser, ISharedFailure>> call();
}
