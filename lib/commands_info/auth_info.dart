import 'package:fastotv_dart/commands_info/login_info.dart';

class AuthInfo extends LoginInfo {
  static const DEVICE_ID_FIELD = 'device_id';
  static const EXPIRED_DATE_FIELD = 'exp_date';

  final int exp_date;
  final String device_id;

  AuthInfo(login, password, this.exp_date, this.device_id)
      : super(login, password);

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    final login = LoginInfo.fromJson(json);
    final exp_date = json[EXPIRED_DATE_FIELD];
    final device_id = json[DEVICE_ID_FIELD];
    return AuthInfo(login.login, login.password, exp_date, device_id);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> login = super.toJson();
    login[DEVICE_ID_FIELD] = device_id;
    login[EXPIRED_DATE_FIELD] = exp_date;
    return login;
  }
}
