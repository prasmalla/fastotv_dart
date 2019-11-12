import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

import 'package:fastotv_dart/json_rpc.dart';
import 'package:fastotv_dart/commands_info/auth_info.dart';
import 'package:fastotv_dart/commands_info/client_info.dart';
import 'package:fastotv_dart/commands_info/runtime_channel_info.dart';
import 'package:fastotv_dart/commands.dart';
import 'package:fastotv_dart/commands_info/login_info.dart';
import 'package:fastotv_dart/src/commands_json.dart';

String generateHash(String data) {
  return md5.convert(utf8.encode(data)).toString();
}

enum ClientConnectionState { DISCONNECTED, CONNECTED, ACTIVE }

abstract class IClientObserver {
  void processRequest(JsonRpcRequest req);

  void processResponse(JsonRpcRequest req, JsonRpcResponse resp);

  void onConnectionStateChanged(ClientConnectionState newState);

  void onSocketError(dynamic error);

  void onDisconnected(dynamic exception);
}

class Client {
  Socket _socket;
  IClientObserver _observer;
  int _id = 0;
  final Map<String, JsonRpcRequest> _requests = {};
  List<int> _recv_buffer = [];

  Client();

  void setObserver(IClientObserver observer) {
    _observer = observer;
  }

  String generateID() {
    int id = _id++;
    var message = Uint8List(8);
    var bytedata = ByteData.view(message.buffer);
    bytedata.setUint64(0, id);
    return hex.encode(message);
  }

  void connect(String server, int port) async {
    if (_socket != null) {
      _socket.destroy();
      _socket = null;
    }

    try {
      _socket = await Socket.connect(server, port);
      _socket.listen(_socketDataReceived,
          onError: _socketErrorReceived,
          onDone: _socketDone,
          cancelOnError: false);
      if (_observer != null) {
        _observer.onConnectionStateChanged(ClientConnectionState.CONNECTED);
      }
    } catch (exception, trace) {
      if (_observer != null) {
        _observer.onConnectionStateChanged(ClientConnectionState.DISCONNECTED);
        _observer.onDisconnected(exception);
      }
    }
  }

  void activate(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    String hash = generateHash(password);
    LoginInfo user = LoginInfo(email, hash);
    var request = activateRequest(generateID(), user);
    return _sendRequest(request);
  }

  void login(String email, String password, String device_id) {
    if (email.isEmpty || password.isEmpty || device_id.isEmpty) {
      return;
    }

    String hash = generateHash(password);
    AuthInfo user = AuthInfo(email, hash, device_id);
    var request = loginRequest(generateID(), user);
    return _sendRequest(request);
  }

  void requestChannels() {
    var request = getChannelsRequest(generateID());
    return _sendRequest(request);
  }

  void requestRuntimeChannelInfo(String sid) {
    RuntimeChannelLiteInfo run = RuntimeChannelLiteInfo(sid);
    var request = getRuntimeChannelInfoRequest(generateID(), run);
    return _sendRequest(request);
  }

  void ping() {
    final now = new DateTime.now();
    final utc = now.toUtc();
    var request =
    pingRequest(generateID(), {'timestamp': utc.millisecondsSinceEpoch});
    return _sendRequest(request);
  }

  void getServerInfo() {
    var request = getServerInfoRequest(generateID());
    return _sendRequest(request);
  }

  void pong(String id) {
    final now = new DateTime.now();
    final utc = now.toUtc();
    var resp = pongResponse(id, {'timestamp': utc.millisecondsSinceEpoch});
    return _sendResponse(resp);
  }

  void notificationTextOK(String id) {
    var resp = pongResponse(id, {});
    return _sendResponse(resp);
  }

  void clientInfo(String id, ClientInfo cl) {
    var resp = clientInfoResponse(id, cl);
    return _sendResponse(resp);
  }

  void dispose() {
    if (_socket != null) {
      _socket.destroy();
    }
    _socket = null;
  }

  // private
  void _sendRequest(JsonRpcRequest request) {
    if (_socket == null) {
      return;
    }

    String req = json.encode(request);
    List<int> gzipped = gzip.encode(req.codeUnits);

    if (!request.isNotification()) {
      _requests[request.id] = request;
    }
    _send(gzipped);
  }

  void _sendResponse(JsonRpcResponse resp) {
    if (_socket == null) {
      return;
    }

    String respStr = json.encode(resp);
    List<int> gzipped = gzip.encode(respStr.codeUnits);
    _send(gzipped);
  }

  void _send(List<int> data) {
    final Uint8List message = Uint8List(4);
    final bytedata = ByteData.view(message.buffer);
    bytedata.setUint32(0, data.length, Endian.big);

    _socket.add(message);
    _socket.add(data);
  }

  void _socketDone() {
    if (_observer != null) {
      _observer.onConnectionStateChanged(ClientConnectionState.DISCONNECTED);
    }
    _socket.destroy();
    _socket = null;
  }

  void _socketErrorReceived(error, trace) {
    if (_observer != null) {
      _observer.onSocketError(error);
    }
  }

  void _processMessage(List<int> payload) {
    List<int> decoded = gzip.decode(payload);
    String req_or_resp_data = String.fromCharCodes(decoded);
    Map<String, dynamic> request_or_response = json.decode(req_or_resp_data);
    if (request_or_response.isEmpty) {
      return;
    }

    if (request_or_response.containsKey('method')) {
      JsonRpcRequest req = JsonRpcRequest.fromJson(request_or_response);
      if (_observer != null) {
        _observer.processRequest(req);
      }
      return;
    }

    // response
    JsonRpcResponse resp = JsonRpcResponse.fromJson(request_or_response);
    if (!resp.isValid()) {
      return;
    }

    JsonRpcRequest req = _requests.remove(resp.id);
    if (req == null || !req.isValid()) {
      return;
    }

    if (req.method == CLIENT_LOGIN) {
      if (_observer != null) {
        if (resp.isMessage()) {
          _observer.onConnectionStateChanged(ClientConnectionState.ACTIVE);
        }
      }
    }

    if (_observer != null) {
      _observer.processResponse(req, resp);
    }
  }

  void _socketDataReceived(List<int> data) {
    _recv_buffer += data;
    if (_recv_buffer.length < 4) {
      return;
    }

    final Uint8List data_size = Uint8List.fromList(_recv_buffer.sublist(0, 4));
    final byte_data = ByteData.view(data_size.buffer);
    int size = byte_data.getUint32(0, Endian.big);

    int message_size = size + 4;
    if (_recv_buffer.length < message_size) {
      return;
    }

    final payload = _recv_buffer.sublist(4, size);
    _processMessage(payload);
    _recv_buffer = _recv_buffer.sublist(message_size);
  }
}
