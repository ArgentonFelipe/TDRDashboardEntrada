import 'package:equatable/equatable.dart';

import '../../../../../shared/domain/entities/user/field_names/logged_user_field_names.dart';

class Employee extends Equatable {
  final int userId;
  final String username;
  final String displayName;

  const Employee({
    required this.userId,
    required this.username,
    required this.displayName,
  });

  @override
  List<Object> get props => [userId, username, displayName];

  Employee copyWith({
    int? userId,
    String? username,
    String? displayName,
  }) {
    return Employee(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, dynamic> objectToMap() {
    return <String, dynamic>{
      LoggedUserFieldNames.userId: userId,
      LoggedUserFieldNames.username: username,
      LoggedUserFieldNames.displayName: displayName,
    };
  }

  factory Employee.mapToObject(Map<String, dynamic> map) {
    return Employee(
      userId: map[LoggedUserFieldNames.userId] ?? 0,
      username: map[LoggedUserFieldNames.username] ?? '',
      displayName: map[LoggedUserFieldNames.displayName] ?? '',
    );
  }

  factory Employee.empty() {
    return const Employee(
      userId: 0,
      username: '',
      displayName: '',
    );
  }
}
