class LoginInfo {
  final String login;
  final String password;

  LoginInfo(this.login, this.password);

  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    final login = json['login'];
    final password = json['password'];
    return LoginInfo(login, password);
  }

  Map<String, dynamic> toJson() => {'login': login, 'password': password};
}
