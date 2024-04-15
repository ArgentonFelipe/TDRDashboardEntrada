import 'package:equatable/equatable.dart';

import '../../../../shared/utils/random_generators/string_random_generator.dart';

abstract interface class IHomeFailure implements Exception {
  final String id;
  final String? message;

  const IHomeFailure({required this.id, this.message});
}

class DefaultHomeFailure implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);
  @override
  final String? message;
  DefaultHomeFailure({this.message});
}

class GetSingleOrderFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  GetSingleOrderFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class LinkOrderWithEmployeeFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  LinkOrderWithEmployeeFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class GetOrdersFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  GetOrdersFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class GetEmployeesFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  GetEmployeesFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class EmptyOrderFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String message =
      'Nenhuma nota foi encontrada para conferir no momento. Por favor, contate o supervisor';

  EmptyOrderFailure();

  @override
  List<Object?> get props => [id, message];
}

class HomeRestRepositoryFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  HomeRestRepositoryFailure({this.message});
  @override
  List<Object?> get props => [id, message];
}

class HomeLocalRepositoryFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;
  HomeLocalRepositoryFailure({this.message});

  @override
  List<Object?> get props => [id, message];
}

class OrdersAlreadyStartedFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String message =
      'A conferência foi iniciada anteriormente mas ainda não finalizada. Por favor, finalize as pendências';
  OrdersAlreadyStartedFailure();

  @override
  List<Object?> get props => [id, message];
}

class EmptyIncompleteOrderFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String message = '';
  EmptyIncompleteOrderFailure();

  @override
  List<Object?> get props => [id, message];
}

class SearchProductWithCodeFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  SearchProductWithCodeFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [id, message];
}

class RegisterBarcodeFailure extends Equatable implements IHomeFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  RegisterBarcodeFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [id, message];
}
