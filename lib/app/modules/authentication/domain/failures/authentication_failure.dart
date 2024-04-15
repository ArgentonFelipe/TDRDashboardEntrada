import 'package:equatable/equatable.dart';

import '../../../../shared/utils/random_generators/string_random_generator.dart';

abstract interface class IAuthenticationFailure implements Exception {
  final String id;
  final String? message;

  IAuthenticationFailure({required this.id, this.message});
}

class LoginWithUsernameAndPasswordFailure extends Equatable
    implements IAuthenticationFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  LoginWithUsernameAndPasswordFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class AuthenticationRepositoryFailure extends Equatable
    implements IAuthenticationFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  AuthenticationRepositoryFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class LogoutFailure extends Equatable implements IAuthenticationFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  LogoutFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class DefaultAuthenticationFailure extends Equatable
    implements IAuthenticationFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  DefaultAuthenticationFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}
