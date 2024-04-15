import 'package:flutter/cupertino.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../../shared/domain/entities/user/logged_user.dart';
import '../../../../../shared/domain/entities/user/login_credential.dart';
import '../../../../../shared/domain/repositories/user_local_repository_interface.dart';
import '../../../../../shared/domain/services/connectivity_service_interface.dart';
import '../../failures/authentication_failure.dart';
import '../../repositories/authentication_repository_interface.dart';
import 'login_with_username_and_password_interface.dart';

class LoginWithUsernameAndPassword implements ILoginWithUsernameAndPassword {
  final IAuthenticationRepository _authenticationRepository;
  final IUserLocalRepository _userLocalRepository;
  final IConnectivityService _connectivityService;

  const LoginWithUsernameAndPassword({
    required IAuthenticationRepository authenticationRepository,
    required IConnectivityService connectivityService,
    required IUserLocalRepository userLocalRepository,
  })  : _authenticationRepository = authenticationRepository,
        _connectivityService = connectivityService,
        _userLocalRepository = userLocalRepository;

  @override
  Future<Result<LoggedUser, IAuthenticationFailure>> call({
    required LoginCredential loginCredential,
  }) async {
    if (loginCredential.isInvalidCredential) {
      return Failure(
        LoginWithUsernameAndPasswordFailure(
          message:
              'As informações da sua credencial são inválidas. Por favor tente novamente',
        ),
      );
    }

    final connectionResult = await _connectivityService.checkConnectivity();

    return connectionResult.fold(
      (_) async {
        final loginResult =
            await _authenticationRepository.loginWithUsernameAndPassword(
          loginCredential: loginCredential,
        );

        return loginResult.fold(
          (loggedUser) async => saveUserData(loggedUser: loggedUser),
          (failure) => Failure(failure),
        );
      },
      (failure) {
        return Failure(
          LoginWithUsernameAndPasswordFailure(
            message: failure.message,
          ),
        );
      },
    );
  }

  @visibleForTesting
  Future<Result<LoggedUser, IAuthenticationFailure>> saveUserData({
    required LoggedUser loggedUser,
  }) async {
    final saveResult = await _userLocalRepository.saveLoggedUser(
      loggedUser,
    );
    return saveResult.fold(
      (_) => Success(loggedUser),
      (failure) {
        return Failure(
          LoginWithUsernameAndPasswordFailure(
            message: failure.message,
          ),
        );
      },
    );
  }
}
