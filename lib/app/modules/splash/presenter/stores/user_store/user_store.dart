import '../../../../../shared/domain/entities/user/logged_user.dart';

class UserStore {
  static UserStore? _instance;
  UserStore._();
  static UserStore get instance => _instance ??= UserStore._();

  LoggedUser loggedUser = LoggedUser.empty();

  void setNewUser(LoggedUser newUser) => loggedUser = newUser;

  String get displayName => loggedUser.displayName;
  bool get isAdmin => loggedUser.isAdmin == 1;
}
