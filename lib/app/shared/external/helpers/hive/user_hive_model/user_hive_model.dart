import 'package:hive/hive.dart';

import 'user_hive_model_fields/user_hive_model_fields.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: 1, adapterName: 'UserHiveModelAdapter')
class UserHiveModel extends HiveObject {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String displayName;
  @HiveField(3)
  final int isAdmin;

  UserHiveModel({
    required this.userId,
    required this.username,
    required this.displayName,
    required this.isAdmin,
  });

  Map<String, dynamic> objectToMap() {
    return {
      UserHiveModelFields.userId: userId,
      UserHiveModelFields.username: username,
      UserHiveModelFields.displayName: displayName,
      UserHiveModelFields.isAdmin: isAdmin,
    };
  }

  factory UserHiveModel.mapToObject(Map<String, dynamic> map) {
    return UserHiveModel(
      userId: map[UserHiveModelFields.userId],
      username: map[UserHiveModelFields.username],
      displayName: map[UserHiveModelFields.displayName],
      isAdmin: map[UserHiveModelFields.isAdmin],
    );
  }
}
