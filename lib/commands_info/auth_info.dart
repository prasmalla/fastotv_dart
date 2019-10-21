import 'package:fastotv_dart/commands_info/login_info.dart';

class AuthInfo extends LoginInfo {
  final String device_id;

  AuthInfo(login, password, this.device_id) : super(login, password);

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    final login = LoginInfo.fromJson(json);
    final device_id = json['device_id'];
    return AuthInfo(login.login, login.password, device_id);
  }

  Map<String, dynamic> toJson() =>
      {'login': login, 'password': password, 'device_id': device_id};
}
