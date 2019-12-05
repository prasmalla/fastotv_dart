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
}
