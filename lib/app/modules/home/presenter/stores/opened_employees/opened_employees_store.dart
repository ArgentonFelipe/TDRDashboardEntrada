import 'package:signals/signals_flutter.dart';

import '../../../domain/entities/employee/employee.dart';

class OpenedEmployeesStore {
  final _openedEmployees = listSignal<Employee>([]);

  void addEmployee(Employee employee) {
    _openedEmployees.add(employee);
  }

  void removeEmployee(Employee employee) {
    _openedEmployees.removeWhere(
      (oldEmployee) => oldEmployee.userId == employee.userId,
    );
  }
}
