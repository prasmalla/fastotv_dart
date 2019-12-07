import 'package:fastotv_dart/commands_info/login_info.dart';

class AuthInfo extends LoginInfo {
  static const DEVICE_ID_FIELD = 'device_id';

  final String device_id;

  AuthInfo(login, password, this.device_id) : super(login, password);

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    final login = LoginInfo.fromJson(json);
    final device_id = json[DEVICE_ID_FIELD];
    return AuthInfo(login.login, login.password, device_id);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> login = super.toJson();
    login[DEVICE_ID_FIELD] = device_id;
    return login;
  }
}

class ServerAuthInfo extends AuthInfo {
  static const EXPIRED_DATE_FIELD = 'exp_date';

  final int exp_date;

  ServerAuthInfo(login, password, device_id, this.exp_date)
      : super(login, password, device_id);

  factory ServerAuthInfo.fromJson(Map<String, dynamic> json) {
    final login = AuthInfo.fromJson(json);
    final exp_date = json[EXPIRED_DATE_FIELD];
    return ServerAuthInfo(
        login.login, login.password, login.device_id, exp_date);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> login = super.toJson();
    login[EXPIRED_DATE_FIELD] = exp_date;
    return login;
  }
}
