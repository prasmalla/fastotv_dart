import 'package:fastotv_dart/json_rpc.dart';
import 'package:fastotv_dart/commands.dart';
import 'package:quiver/core.dart';

JsonRpcRequest activateRequest(String id, dynamic params) {
  final par = Optional<dynamic>.of(params);
  return JsonRpcRequest(id: id, method: CLIENT_ACTIVATE_DEVICE, params: par);
}

JsonRpcRequest loginRequest(String id, dynamic params) {
  final par = Optional<dynamic>.of(params);
  return JsonRpcRequest(id: id, method: CLIENT_LOGIN, params: par);
}

JsonRpcRequest pingRequest(String id, dynamic params) {
  final par = Optional<dynamic>.of(params);
  return JsonRpcRequest(id: id, method: CLIENT_PING, params: par);
}

JsonRpcRequest getServerInfoRequest(String id) {
  return JsonRpcRequest(id: id, method: CLIENT_GET_SERVER_INFO);
}

JsonRpcRequest getChannelsRequest(String id) {
  return JsonRpcRequest(id: id, method: CLIENT_GET_CHANNELS);
}

JsonRpcRequest getRuntimeChannelInfoRequest(String id, dynamic params) {
  final par = Optional<dynamic>.of(params);
  return JsonRpcRequest(
      id: id, method: CLIENT_GET_RUNTIME_CHANNEL_INFO, params: par);
}

// responses
JsonRpcResponse pongResponse(String id, dynamic result) {
  final res = Optional<dynamic>.of(result);
  return JsonRpcResponse(id, res);
}

JsonRpcResponse clientInfoResponse(String id, dynamic result) {
  final res = Optional<dynamic>.of(result);
  return JsonRpcResponse(id, res);
}
