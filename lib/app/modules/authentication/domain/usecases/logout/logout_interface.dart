import 'package:result_dart/result_dart.dart';

import '../../failures/authentication_failure.dart';

abstract interface class ILogout {
  Future<Result<Unit, IAuthenticationFailure>> call();
}
