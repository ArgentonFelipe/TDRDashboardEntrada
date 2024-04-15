import 'package:result_dart/result_dart.dart';

import '../../../../shared/domain/entities/user/logged_user.dart';
import '../../../../shared/domain/entities/user/login_credential.dart';
import '../failures/authentication_failure.dart';

abstract interface class IAuthenticationRepository {
  Future<Result<LoggedUser, IAuthenticationFailure>>
      loginWithUsernameAndPassword({
    required LoginCredential loginCredential,
  });
}
