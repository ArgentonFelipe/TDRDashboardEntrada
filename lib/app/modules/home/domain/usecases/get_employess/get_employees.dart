import 'package:result_dart/result_dart.dart';

import '../../../../../shared/domain/services/connectivity_service_interface.dart';
import '../../repositories/home_rest_repository_interface.dart';
import '../../entities/employee/employee.dart';
import '../../failures/home_failures.dart';
import 'get_employees_interface.dart';

class GetEmployees implements IGetEmployees {
  final IConnectivityService _connectivityService;
  final IHomeRestRepository _homeRestRepository;

  GetEmployees({
    required IConnectivityService connectivityService,
    required IHomeRestRepository homeRestRepository,
  })  : _connectivityService = connectivityService,
        _homeRestRepository = homeRestRepository;

  @override
  Future<Result<List<Employee>, IHomeFailure>> call() async {
    final connectivityResult = await _connectivityService.checkConnectivity();
    return connectivityResult.fold(
      (_) async {
        return await _homeRestRepository.getEmployees();
      },
      (failure) {
        return Failure(GetEmployeesFailure(message: failure.message));
      },
    );
  }
}
