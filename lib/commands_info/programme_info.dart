class ProgrammeInfo {
  final String channel;
  final int start;
  final int stop;
  final String title;

  ProgrammeInfo(this.channel, this.start, this.stop, this.title);

  ProgrammeInfo.fromJson(Map<String, dynamic> json)
      : channel = json['channel'],
        start = json['start'],
        stop = json['stop'],
        title = json['title'];

  Map<String, dynamic> toJson() =>
      {'channel': channel, 'start': start, 'stop': stop, 'title': title};
}
