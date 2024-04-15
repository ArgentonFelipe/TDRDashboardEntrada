import 'package:result_dart/result_dart.dart';

import '../../entities/user/logged_user.dart';
import '../../repositories/user_local_repository_interface.dart';
import '../../shared_failures/shared_failure.dart';
import 'get_logged_user_interface.dart';

class GetLoggedUser implements IGetLoggedUser {
  final IUserLocalRepository _userLocalRepository;

  const GetLoggedUser({
    required IUserLocalRepository userLocalRepository,
  }) : _userLocalRepository = userLocalRepository;
  @override
  Future<Result<LoggedUser, ISharedFailure>> call() async {
    return await _userLocalRepository.getLoggedUser();
  }
}
