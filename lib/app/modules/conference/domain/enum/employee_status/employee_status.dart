enum EmployeeStatus {
  notBegining(description: 'Não Iniciada', type: 0),
  inConference(description: 'Em Conferência', type: 10),
  confered(description: 'Conferida', type: 100);

  const EmployeeStatus({required this.type, required this.description});

  final int type;
  final String description;

  static EmployeeStatus getStatus(int status) {
    switch (status) {
      case 0:
        return EmployeeStatus.notBegining;
      case 10:
        return EmployeeStatus.inConference;
      case 100:
        return EmployeeStatus.confered;
      default:
        return EmployeeStatus.notBegining;
    }
  }
}
