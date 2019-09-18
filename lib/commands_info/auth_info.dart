class AuthInfo {
  final String login;
  final String password;
  final String device_id;

  AuthInfo(this.login, this.password, this.device_id);

  AuthInfo.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        password = json['password'],
        device_id = json['device_id'];

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
        'device_id': device_id,
      };
}
