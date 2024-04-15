class LoginCredential {
  final String username;
  final String password;

  const LoginCredential._({required this.username, required this.password});

  bool get isInvalidCredential {
    return password.isEmpty || username.isEmpty;
  }

  factory LoginCredential.withUsernameAndPassword({
    required String username,
    required String password,
  }) {
    return LoginCredential._(username: username, password: password);
  }
}
