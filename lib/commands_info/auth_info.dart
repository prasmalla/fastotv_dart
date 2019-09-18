class AuthInfo {
  final String login;
  final String password;
  final String deviceId;

  AuthInfo(this.login, this.password, this.deviceId);

  AuthInfo.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        password = json['password'],
        deviceId = json['device_id'];

  Map<String, dynamic> toJson() => {
        'login': login,
        'password': password,
        'device_id': deviceId,
      };
}
