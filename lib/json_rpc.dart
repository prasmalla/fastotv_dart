class JsonRpcRequest {
  String jsonrpc = '2.0';
  String method;
  dynamic params;
  String id;

  JsonRpcRequest(this.id, this.method, this.params);

  bool isValid() {
    return method.isNotEmpty;
  }

  bool isNotification() {
    return id.isEmpty;
  }

  Map<String, dynamic> toJson() {
    if (id.isEmpty) {
      return {'jsonrpc': jsonrpc, 'method': method, 'params': params};
    }

    return {'jsonrpc': jsonrpc, 'id': id, 'method': method, 'params': params};
  }

  JsonRpcRequest.fromJson(Map<String, dynamic> json)
      : jsonrpc = json['jsonrpc'],
        id = json['id'],
        method = json['method'],
        params = json['params'];
}

class Error {
  final int code;
  final String message;

  Error(this.code, this.message);

  bool isValid() {
    return message.isNotEmpty;
  }

  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }

  Error.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];
}

class JsonRpcResponse {
  String jsonrpc = '2.0';
  String id;
  dynamic result;
  Error error;

  JsonRpcResponse(this.id, this.result);

  bool isValid() {
    return id.isNotEmpty;
  }

  bool isMessage() {
    if (result == null) {
      return false;
    }

    return result.isNotEmpty;
  }

  bool isError() {
    if (error == null) {
      return false;
    }

    return error.isValid();
  }

  Map<String, dynamic> toJson() {
    if (isError()) {
      return {'jsonrpc': jsonrpc, 'id': id, 'error': error};
    }

    return {'jsonrpc': jsonrpc, 'id': id, 'result': result};
  }

  JsonRpcResponse.fromJson(Map<String, dynamic> json)
      : jsonrpc = json['jsonrpc'],
        id = json['id'],
        result = json['result'] {
    dynamic err = json['error'];
    if (err != null) {
      error = Error.fromJson(err);
    }
  }
}
