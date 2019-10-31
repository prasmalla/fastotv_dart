import 'package:quiver/core.dart';

class JsonRpcRequest {
  String jsonrpc = '2.0';
  final String method;
  final String id;
  Optional<dynamic> params = Optional<dynamic>.absent();

  JsonRpcRequest({this.id, this.method, dynamic params = null})
      : params = Optional<dynamic>.fromNullable(params) {}

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
        result['params'] = params.value;
      }
      return result;
    }

    Map<String, dynamic> result = {
      'jsonrpc': jsonrpc,
      'id': id,
      'method': method
    };
    if (params.isPresent) {
      result['params'] = params.value;
    }
    return result;
  }

  JsonRpcRequest.fromJson(Map<String, dynamic> json)
      : jsonrpc = json['jsonrpc'],
        id = json['id'],
        method = json['method'] {
    if (json.containsKey('params')) {
      params = Optional<dynamic>.fromNullable(json['params']);
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
  Optional<dynamic> result = Optional<dynamic>.absent();
  Optional<Error> error = Optional<Error>.absent();

  JsonRpcResponse({this.id, dynamic result = null, Error error = null})
      : result = Optional<dynamic>.fromNullable(result),
        error = Optional<Error>.fromNullable(error) {}

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
      return {'jsonrpc': jsonrpc, 'id': id, 'error': error.value};
    }

    return {'jsonrpc': jsonrpc, 'id': id, 'result': result.value};
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
