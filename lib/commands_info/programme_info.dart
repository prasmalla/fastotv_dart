import 'package:quiver/core.dart';

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
  static const CATEGORY_FIELD = 'category';
  static const DESCRIPTION_FIELD = 'description';

  final String channel;
  final int start;
  final int stop;
  final String title;
  Optional<String> category = Optional<String>.absent();
  Optional<String> description = Optional<String>.absent();

  ProgrammeInfo(this.channel, this.start, this.stop, this.title, String cat, String desc)
      : category = Optional<String>.fromNullable(cat),
        description = Optional<String>.fromNullable(desc);

  factory ProgrammeInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final channel = json[CHANNEL_FIELD];
    final start = json[START_FIELD];
    final stop = json[STOP_FIELD];
    final title = json[TITLE_FIELD];
    final category = json[CATEGORY_FIELD];
    final desc = json[DESCRIPTION_FIELD];
    return ProgrammeInfo(channel, start, stop, title, category, desc);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {CHANNEL_FIELD: channel, START_FIELD: start, STOP_FIELD: stop, TITLE_FIELD: title};
    if (category.isPresent) {
      result[CATEGORY_FIELD] = category.value;
    }
    if (description.isPresent) {
      result[DESCRIPTION_FIELD] = description.value;
    }
    return result;
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
