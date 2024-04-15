import 'package:flutter_modular/flutter_modular.dart';
import 'package:signals/signals.dart';

import '../../../../../shared/domain/entities/user/logged_user.dart';
import '../../../../../shared/utils/default_failure_messages/default_failure_messages.dart';
import '../../../../../shared/utils/helpers/messages/messages.dart';
import '../../../../../shared/utils/routes/app_routes.dart';
import '../../../../authentication/domain/usecases/logout/logout_interface.dart';
import '../../../../splash/presenter/stores/app_store/app_store.dart';
import '../../../../splash/presenter/stores/user_store/user_store.dart';
import '../../../domain/entities/employee/employee.dart';
import '../../../domain/usecases/get_employess/get_employees_interface.dart';

class HomeController with MessageStateMixin {
  final UserStore _userStore;
  final AppStore _appStore;
  final ILogout _logout;
  final IGetEmployees _getEmployees;

  HomeController({
    required UserStore userStore,
    required AppStore appStore,
    required ILogout logout,
    required IGetEmployees getEmployees,
  })  : _userStore = userStore,
        _appStore = appStore,
        _logout = logout,
        _getEmployees = getEmployees;

  final _isEmployessLoading = signal<bool>(false);
  final _employees = listSignal<Employee>([]);
  final _localEmployees = <Employee>[];

  bool get isEmployessLoading => _isEmployessLoading.value;

  List<Employee> get employees => _employees;

  void setEmployeeLoading(bool isEmployessLoading) {
    _isEmployessLoading.value = isEmployessLoading;
  }

  String get appVersion {
    return 'Versão ${_appStore.appInformations.version}+${_appStore.appInformations.buildNumber}';
  }

  Future<void> doLogout() async {
    final logoutResult = await _logout();
    logoutResult.fold(
      (result) {
        _userStore.setNewUser(LoggedUser.empty());
        Modular.to.pushReplacementNamed('${AppRoutes.authentication}/');
      },
      (failure) {
        showError(failure.message ?? DefaultFailureMessages.errorMessage);
      },
    );
  }

  void pushRegisterCode() {
    Modular.to.pushNamed(
      '${AppRoutes.home}${AppRoutes.registerBarcode}',
    );
  }

  void pushOrdersPage() {
    Modular.to.pushNamed(
      '${AppRoutes.home}${AppRoutes.orders}',
    );
  }

  Future<void> getAllEmployees() async {
    setEmployeeLoading(true);
    final getResult = await _getEmployees();
    getResult.fold(
      (employees) {
        _localEmployees.clear();
        _employees.clear();
        _localEmployees.addAll(employees);
        _employees.addAll(employees);
      },
      (failure) {
        showError(failure.message ?? DefaultFailureMessages.errorMessage);
      },
    );
    setEmployeeLoading(false);
  }

  void searchEmployeeWithName(String name) {
    final localEmployees = _localEmployees;
    if (name.isEmpty) {
      _employees.clear();
      _employees.addAll(_localEmployees);
    }

    _employees.clear();
    _employees.value = localEmployees.where(
      (employee) {
        return employee.displayName.contains(name);
      },
    ).toList();
  }
}
