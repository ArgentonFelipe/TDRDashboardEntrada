import 'package:equatable/equatable.dart';

import 'field_names/logged_user_field_names.dart';

class LoggedUser extends Equatable {
  final int userId;
  final String username;
  final String displayName;
  final int isAdmin;

  const LoggedUser({
    required this.userId,
    required this.username,
    required this.displayName,
    required this.isAdmin,
  });

  @override
  List<Object> get props => [
        userId,
        username,
        displayName,
      ];

  LoggedUser copyWith({
    int? userId,
    String? username,
    String? displayName,
    String? email,
    int? isAdmin,
  }) {
    return LoggedUser(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  Map<String, dynamic> objectToMap() {
    return {
      LoggedUserFieldNames.userId: userId,
      LoggedUserFieldNames.username: username,
      LoggedUserFieldNames.displayName: displayName,
      LoggedUserFieldNames.isAdmin: isAdmin,
    };
  }

  factory LoggedUser.mapToObject(Map<String, dynamic> map) {
    return LoggedUser(
      userId: map[LoggedUserFieldNames.userId] ?? 0,
      username: map[LoggedUserFieldNames.username] ?? '',
      displayName: map[LoggedUserFieldNames.displayName] ?? '',
      isAdmin: map[LoggedUserFieldNames.isAdmin] ?? 0,
    );
  }

  factory LoggedUser.empty() {
    return const LoggedUser(
      userId: 0,
      username: '',
      displayName: '',
      isAdmin: 0,
    );
  }
}
