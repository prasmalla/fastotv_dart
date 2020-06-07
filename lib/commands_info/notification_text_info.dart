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
  final int showTime;

  static const MIN_TIME = 1;
  static const MAX_TIME = 3600;

  NotificationTextInfo(this.message, this.type, this.showTime);

  bool isValid() {
    return message.isNotEmpty && showTime >= MIN_TIME && showTime <= MAX_TIME && type != null;
  }

  factory NotificationTextInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final message = json[TEXT_FIELD];
    final type = NotificationType.fromInt(json[TYPE_FIELD]);
    final showTime = json[SHOW_TIME_FIELD];
    return NotificationTextInfo(message, type, showTime);
  }

  Map<String, dynamic> toJson() {
    return {TEXT_FIELD: message, TYPE_FIELD: type.toInt(), SHOW_TIME_FIELD: showTime};
  }
}
