class LoginInfo {
  static const LOGIN_FIELD = 'login';
  static const PASSWORD_FIELD = 'password';

  final String login;
  final String password;

  LoginInfo(this.login, this.password);

  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    final login = json[LOGIN_FIELD];
    final password = json[PASSWORD_FIELD];
    return LoginInfo(login, password);
  }

  Map<String, dynamic> toJson() {
    return {LOGIN_FIELD: login, PASSWORD_FIELD: password};
  }
}
