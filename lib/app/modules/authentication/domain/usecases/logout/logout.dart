import 'package:result_dart/result_dart.dart';

import '../../../../../shared/domain/repositories/user_local_repository_interface.dart';
import '../../failures/authentication_failure.dart';
import 'logout_interface.dart';

class Logout implements ILogout {
  final IUserLocalRepository _userLocalRepository;

  const Logout({
    required IUserLocalRepository userLocalRepository,
  }) : _userLocalRepository = userLocalRepository;

  @override
  Future<Result<Unit, IAuthenticationFailure>> call() async {
    final logoutResult = await _userLocalRepository.logout();

    return logoutResult.mapError(
      (failure) {
        return LogoutFailure(message: failure.message);
      },
    ).fold(
      (_) => const Success(unit),
      (failure) => Failure(failure),
    );
  }
}
