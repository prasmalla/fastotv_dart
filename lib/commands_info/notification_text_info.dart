class NotificationType {
  final int _value;

  const NotificationType._(this._value);

  int toInt() {
    return _value;
  }

  String toString() {
    if (_value == 0) {
      return 'TEXT';
    }
    return 'HYPERLINK';
  }

  factory NotificationType.fromInt(int value) {
    if (value == 0) {
      return NotificationType.TEXT;
    }
    return NotificationType.HYPERLINK;
  }

  static get values => [TEXT, HYPERLINK];

  static const NotificationType TEXT = NotificationType._(0);
  static const NotificationType HYPERLINK = NotificationType._(1);
}

class NotificationTextInfo {
  static const TEXT_FIELD = 'message';
  static const TYPE_FIELD = 'type';
  static const SHOW_TIME_FIELD = 'show_time';

  final String message;
  final NotificationType type;
  final int show_time;

  NotificationTextInfo(this.message, this.type, this.show_time);

  NotificationTextInfo.fromJson(Map<String, dynamic> json)
      : message = json[TEXT_FIELD],
        type = NotificationType.fromInt(json[TYPE_FIELD]),
        show_time = json[SHOW_TIME_FIELD];

  Map<String, dynamic> toJson() {
    return {TEXT_FIELD: message, TYPE_FIELD: type.toInt(), SHOW_TIME_FIELD: show_time};
  }
}
