import 'package:quiver/core.dart';

class JsonRpcRequest {
  String jsonrpc = '2.0';
  final String method;
  final String id;
  Optional<dynamic> params;

  JsonRpcRequest(
      {this.id, this.method, this.params = const Optional<dynamic>.absent()});

  bool isValid() {
    return method.isNotEmpty;
  }

  bool isNotification() {
    return id.isEmpty;
  }

  Map<String, dynamic> toJson() {
    if (id.isEmpty) {
      // notification
      Map<String, dynamic> result = {'jsonrpc': jsonrpc, 'method': method};
      if (params.isPresent) {
        result['params'] = params;
      }
      return result;
    }

    Map<String, dynamic> result = {
      'jsonrpc': jsonrpc,
      'id': id,
      'method': method
    };
    if (params.isPresent) {
      result['params'] = params;
    }
    return result;
  }

  JsonRpcRequest.fromJson(Map<String, dynamic> json)
      : jsonrpc = json['jsonrpc'],
        id = json['id'],
        method = json['method'] {
    if (json.containsKey('params')) {
      params = Optional<dynamic>.of(json['params']);
    }
  }
}

class Error {
  final int code;
  final String message;

  Error(this.code, this.message);

  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }

  Error.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];
}

class JsonRpcResponse {
  String jsonrpc = '2.0';
  final String id;
  Optional<dynamic> result;
  Optional<Error> error;

  JsonRpcResponse(this.id, this.result);

  bool isValid() {
    return id.isNotEmpty;
  }

  bool isMessage() {
    return result.isPresent;
  }

  bool isError() {
    return error.isPresent;
  }

  Map<String, dynamic> toJson() {
    if (isError()) {
      return {'jsonrpc': jsonrpc, 'id': id, 'error': error};
    }

    return {'jsonrpc': jsonrpc, 'id': id, 'result': result};
  }

  JsonRpcResponse.fromJson(Map<String, dynamic> json)
      : jsonrpc = json['jsonrpc'],
        id = json['id'] {
    if (json.containsKey('error')) {
      final err = Error.fromJson(json['error']);
      error = Optional<Error>.of(err);
      return;
    }

    if (json.containsKey('result')) {
      final res = json['result'];
      result = Optional<dynamic>.of(res);
      return;
    }
  }
}
