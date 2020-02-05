import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

import 'package:fastotv_dart/json_rpc.dart';
import 'package:fastotv_dart/commands_info/auth_info.dart';
import 'package:fastotv_dart/commands_info/client_info.dart';
import 'package:fastotv_dart/commands_info/runtime_channel_info.dart';
import 'package:fastotv_dart/commands_info/catchup_generate_info.dart';
import 'package:fastotv_dart/commands_info/catchup_undo_info.dart';
import 'package:fastotv_dart/commands.dart';
import 'package:fastotv_dart/commands_info/login_info.dart';
import 'package:fastotv_dart/commands_info/interrupt_stream_info.dart';
import 'package:fastotv_dart/commands_info/recent_info.dart';
import 'package:fastotv_dart/commands_info/favorite_info.dart';
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
  List<int> _recvBuffer = [];

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
      _socket.listen(_socketDataReceived, onError: _socketErrorReceived, onDone: _socketDone, cancelOnError: false);
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

  void requestCatchup(String sid, int start, int stop) {
    CatchupGenerateInfo cat = CatchupGenerateInfo(sid, start, stop);
    var request = catchupRequest(generateID(), cat);
    return _sendRequest(request);
  }

  void requestUndoCatchup(String sid) {
    CatchupUndoInfo cat = CatchupUndoInfo(sid);
    var request = catchupUndoRequest(generateID(), cat);
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

  void sendFavoriteInfo(String sid, bool value) {
    FavoriteInfo fav = FavoriteInfo(sid, value);
    var request = setFavoriteRequest(sid, fav);
    return _sendRequest(request);
  }

  void sendRecentInfo(String sid, int value) {
    RecentInfo recent = RecentInfo(sid, value);
    var request = addRecentRequest(sid, recent);
    return _sendRequest(request);
  }

  void sendInterruptInfo(String sid, int msec) {
    InterruptStreamTimeInfo inter = InterruptStreamTimeInfo(sid, msec);
    var request = interruptStreamTimeRequest(sid, inter);
    return _sendRequest(request);
  }

  void ping() {
    final now = new DateTime.now();
    final utc = now.toUtc();
    var request = pingRequest(generateID(), {'timestamp': utc.millisecondsSinceEpoch});
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

  // private:
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

  bool _processMessage(List<int> payload) {
    List<int> decoded = gzip.decode(payload);
    String req_or_resp_data = String.fromCharCodes(decoded);
    Map<String, dynamic> request_or_response = json.decode(req_or_resp_data);
    if (request_or_response.isEmpty) {
      return false;
    }

    if (request_or_response.containsKey('method')) {
      JsonRpcRequest req = JsonRpcRequest.fromJson(request_or_response);
      if (_observer != null) {
        _observer.processRequest(req);
      }
      return true;
    }

    // response
    JsonRpcResponse resp = JsonRpcResponse.fromJson(request_or_response);
    if (!resp.isValid()) {
      return true;
    }

    JsonRpcRequest req = _requests.remove(resp.id);
    if (req == null || !req.isValid()) {
      return true;
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
    return true;
  }

  void _socketDataReceived(List<int> data) {
    _recvBuffer += data;
    _handleData();
  }

  void _handleData() {
    if (_recvBuffer.length < 4) {
      return;
    }

    final Uint8List data_size = Uint8List.fromList(_recvBuffer.sublist(0, 4));
    final byte_data = ByteData.view(data_size.buffer);
    int size = byte_data.getUint32(0, Endian.big);

    int message_size = size + 4;
    if (_recvBuffer.length < message_size) {
      return;
    }

    final payload = _recvBuffer.sublist(4, size);
    if (_processMessage(payload)) {
      _recvBuffer = _recvBuffer.sublist(message_size);
      _handleData();
    }
  }
}
