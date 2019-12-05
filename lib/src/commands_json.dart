import 'package:fastotv_dart/json_rpc.dart';
import 'package:fastotv_dart/commands.dart';

JsonRpcRequest activateRequest(String id, dynamic params) {
  return JsonRpcRequest(id: id, method: CLIENT_ACTIVATE_DEVICE, params: params);
}

JsonRpcRequest loginRequest(String id, dynamic params) {
  return JsonRpcRequest(id: id, method: CLIENT_LOGIN, params: params);
}

JsonRpcRequest pingRequest(String id, dynamic params) {
  return JsonRpcRequest(id: id, method: CLIENT_PING, params: params);
}

JsonRpcRequest getServerInfoRequest(String id) {
  return JsonRpcRequest(id: id, method: CLIENT_GET_SERVER_INFO);
}

JsonRpcRequest getChannelsRequest(String id) {
  return JsonRpcRequest(id: id, method: CLIENT_GET_CHANNELS);
}

JsonRpcRequest getRuntimeChannelInfoRequest(String id, dynamic params) {
  return JsonRpcRequest(
      id: id, method: CLIENT_GET_RUNTIME_CHANNEL_INFO, params: params);
}

JsonRpcRequest catchupRequest(String id, dynamic params) {
  return JsonRpcRequest(id: id, method: CLIENT_REQUEST_CATCHUP, params: params);
}

// responses
JsonRpcResponse pongResponse(String id, dynamic result) {
  return JsonRpcResponse(id: id, result: result);
}

JsonRpcResponse clientInfoResponse(String id, dynamic result) {
  return JsonRpcResponse(id: id, result: result);
}
