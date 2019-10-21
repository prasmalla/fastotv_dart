import 'package:fastotv_dart/json_rpc.dart';
import 'package:fastotv_dart/commands.dart';

JsonRpcRequest activateRequest(String id, dynamic params) {
  return JsonRpcRequest(id, CLIENT_ACTIVATE_DEVICE, params);
}

JsonRpcRequest loginRequest(String id, dynamic params) {
  return JsonRpcRequest(id, CLIENT_LOGIN, params);
}

JsonRpcRequest pingRequest(String id, dynamic params) {
  return JsonRpcRequest(id, CLIENT_PING, params);
}

JsonRpcRequest getServerInfoRequest(String id) {
  return JsonRpcRequest(id, CLIENT_GET_SERVER_INFO, null);
}

JsonRpcRequest getChannelsRequest(String id) {
  return JsonRpcRequest(id, CLIENT_GET_CHANNELS, null);
}

JsonRpcRequest getRuntimeChannelInfoRequest(String id, dynamic params) {
  return JsonRpcRequest(id, CLIENT_GET_RUNTIME_CHANNEL_INFO, params);
}

// responses
JsonRpcResponse pongResponse(String id, dynamic result) {
  return JsonRpcResponse(id, result);
}

JsonRpcResponse clientInfoResponse(String id, dynamic result) {
  return JsonRpcResponse(id, result);
}
