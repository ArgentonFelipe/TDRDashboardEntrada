import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../../../../shared/domain/entities/user/logged_user.dart';
import '../../../../shared/domain/entities/user/login_credential.dart';
import '../../../../shared/external/helpers/rest_client/exceptions/rest_client_exception.dart';
import '../../../../shared/external/helpers/rest_client/interfaces/rest_client_interface.dart';
import '../../../../shared/utils/default_failure_messages/default_failure_messages.dart';
import '../../domain/failures/authentication_failure.dart';
import '../../domain/repositories/authentication_repository_interface.dart';
import 'urls/authentication_urls.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IRestClient _restClient;

  const AuthenticationRepository({
    required IRestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Result<LoggedUser, IAuthenticationFailure>>
      loginWithUsernameAndPassword({
    required LoginCredential loginCredential,
  }) async {
    try {
      final response = await _restClient.post(
        AuthenticationURLs.loginURL,
        data: {
          'USUARIO': loginCredential.username,
          'SENHA': loginCredential.password,
        },
      );

      final responseBody = response.data;
      if (responseBody is List && responseBody.isEmpty) {
        return Failure(
          AuthenticationRepositoryFailure(
            message: 'Este usuário não é um usuário do sistema',
          ),
        );
      }

      return Success(LoggedUser.mapToObject(responseBody));
    } on TimeoutException {
      return Failure(
        AuthenticationRepositoryFailure(
          message: DefaultFailureMessages.timeoutMessage,
        ),
      );
    } on RestClientException catch (failure) {
      return Failure(
        AuthenticationRepositoryFailure(
          message: failure.message,
        ),
      );
    }
  }
}
