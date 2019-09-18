import 'package:fastotv_dart/json_rpc.dart';
import 'package:fastotv_dart/commands.dart';

JsonRpcRequest activateRequest(String id, dynamic params) {
  return JsonRpcRequest(id, CLIENT_ACTIVE, params);
}

JsonRpcRequest getChannelsRequest(String id) {
  return JsonRpcRequest(id, GET_CHANNELS, null);
}

JsonRpcResponse pongResponse(String id, dynamic result) {
  return JsonRpcResponse(id, result);
}
