import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../../../../shared/external/helpers/rest_client/exceptions/rest_client_exception.dart';
import '../../../../shared/external/helpers/rest_client/interfaces/rest_client_interface.dart';
import '../../../../shared/external/helpers/rest_client/urls/rest_urls.dart';
import '../../../../shared/utils/default_failure_messages/default_failure_messages.dart';
import '../../domain/entities/employee/employee.dart';
import '../../domain/failures/home_failures.dart';
import '../../domain/repositories/home_rest_repository_interface.dart';

class HomeRestRepository implements IHomeRestRepository {
  final IRestClient _restClient;

  const HomeRestRepository({
    required IRestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Result<List<Employee>, IHomeFailure>> getEmployees() async {
    try {
      final response = await _restClient.get(RestURLs.getEmployees);

      final responseData = response.data as List;
      if (responseData.isNotEmpty) {
        final employees = responseData.map((map) {
          return Employee.mapToObject(map);
        }).toList();
        return Success(employees);
      }
      return const Success([]);
    } on TimeoutException {
      return Failure(
        HomeRestRepositoryFailure(
          message: DefaultFailureMessages.timeoutMessage,
        ),
      );
    } on RestClientException catch (failure) {
      return Failure(
        HomeRestRepositoryFailure(
          message: failure.message,
        ),
      );
    }
  }
}
