import 'package:equatable/equatable.dart';
import 'package:tdr_core/tdr_core.dart';

abstract class IConferenceFailure implements Exception {
  final String id;
  final String? message;

  const IConferenceFailure({required this.id, this.message});
}

class GetOrdersFailure extends Equatable implements IConferenceFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  GetOrdersFailure({this.message});

  @override
  List<Object?> get props => [id, message];
}

class ConferenceRestRepositoryFailure extends Equatable
    implements IConferenceFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;

  ConferenceRestRepositoryFailure({this.message});

  @override
  List<Object?> get props => [id, message];
}
