class ContentType {
  final int _value;

  const ContentType._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'LIVE';
    } else if (_value == 1) {
      return 'VODS';
    }
    return 'SERIAL';
  }

  factory ContentType.fromInt(int value) {
    if (value == 0) {
      return ContentType.LIVE;
    } else if (value == 1) {
      return ContentType.VODS;
    }
    return ContentType.SERIAL;
  }

  static get values => [LIVE, VODS, SERIAL];

  static const ContentType LIVE = ContentType._(0);
  static const ContentType VODS = ContentType._(1);
  static const ContentType SERIAL = ContentType._(2);
}

class RequestStatus {
  final int _value;

  const RequestStatus._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'New';
    } else if (_value == 1) {
      return 'In progress';
    }
    return 'Done';
  }

  factory RequestStatus.fromInt(int value) {
    if (value == 0) {
      return RequestStatus.NEW;
    } else if (value == 1) {
      return RequestStatus.IN_PROGRESS;
    }
    return RequestStatus.DONE;
  }

  static get values => [NEW, IN_PROGRESS, DONE];

  static const RequestStatus NEW = RequestStatus._(0);
  static const RequestStatus IN_PROGRESS = RequestStatus._(1);
  static const RequestStatus DONE = RequestStatus._(2);
}

class CreateContentRequestInfo {
  static const TITLE_FIELD = 'title';
  static const CONTENT_TYPE_FIELD = 'type';
  static const REQUEST_STATUS_FIELD = 'status';

  String title;
  ContentType type;
  RequestStatus status;

  static const MIN_TIME = 1;
  static const MAX_TIME = 3600;

  CreateContentRequestInfo(this.title, this.type, this.status);

  CreateContentRequestInfo copy() {
    return CreateContentRequestInfo(title, type, status);
  }

  bool isValid() {
    return title != null && title.isNotEmpty && type != null && status != null;
  }

  factory CreateContentRequestInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final title = json[TITLE_FIELD];
    final type = ContentType.fromInt(json[CONTENT_TYPE_FIELD]);
    final status = RequestStatus.fromInt(json[REQUEST_STATUS_FIELD]);
    return CreateContentRequestInfo(title, type, status);
  }

  Map<String, dynamic> toJson() {
    return {TITLE_FIELD: title, CONTENT_TYPE_FIELD: type.toInt(), REQUEST_STATUS_FIELD: status.toInt()};
  }
}

class ContentRequestInfo extends CreateContentRequestInfo {
  static const ID_FIELD = 'id';

  final String id;

  ContentRequestInfo(this.id, String title, ContentType type, RequestStatus status) : super(title, type, status);

  ContentRequestInfo copy() {
    return ContentRequestInfo(id, title, type, status);
  }

  bool isValid() {
    return super.isValid();
  }

  factory ContentRequestInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final CreateContentRequestInfo req = CreateContentRequestInfo.fromJson(json);
    return ContentRequestInfo(json[ID_FIELD], req.title, req.type, req.status);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = super.toJson();
    result[ID_FIELD] = id;
    return result;
  }
}
