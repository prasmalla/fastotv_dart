String _twoDigits(int n) {
  if (n >= 10) {
    return "$n";
  }
  return "0$n";
}

class ProgrammeInfo {
  static const CHANNEL_FIELD = 'channel';
  static const START_FIELD = 'start';
  static const STOP_FIELD = 'stop';
  static const TITLE_FIELD = 'title';

  final String channel;
  final int start;
  final int stop;
  final String title;

  ProgrammeInfo(this.channel, this.start, this.stop, this.title);

  ProgrammeInfo.fromJson(Map<String, dynamic> json)
      : channel = json[CHANNEL_FIELD],
        start = json[START_FIELD],
        stop = json[STOP_FIELD],
        title = json[TITLE_FIELD];

  Map<String, dynamic> toJson() {
    return {
      CHANNEL_FIELD: channel,
      START_FIELD: start,
      STOP_FIELD: stop,
      TITLE_FIELD: title
    };
  }

  String getStart(Duration timeZoneOffset) {
    final startTime = Duration(milliseconds: this.start) + timeZoneOffset;
    final diff = startTime - Duration(days: startTime.inDays);

    final hours = diff.inHours;
    final minutes = (diff - Duration(hours: diff.inHours)).inMinutes;
    return _twoDigits(hours) + ':' + _twoDigits(minutes);
  }

  String getEnd(Duration timeZoneOffset) {
    final stopTime = Duration(milliseconds: this.stop) + timeZoneOffset;
    final diff = stopTime - Duration(days: stopTime.inDays);

    final hours = diff.inHours;
    final minutes = (diff - Duration(hours: diff.inHours)).inMinutes;
    return _twoDigits(hours) + ':' + _twoDigits(minutes);
  }

  String getDuration() {
    final startTime = Duration(milliseconds: this.start);
    final stopTime = Duration(milliseconds: this.stop);
    final diff = stopTime - startTime;
    final twoDigitMinutes = _twoDigits(diff.inMinutes.remainder(60));
    return '${_twoDigits(diff.inHours)}:$twoDigitMinutes';
  }
}
