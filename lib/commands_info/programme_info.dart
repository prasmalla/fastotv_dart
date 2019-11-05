class ProgrammeInfo {
  final int start;
  final int stop;
  final String title;

  ProgrammeInfo(this.start, this.stop, this.title);

  ProgrammeInfo.fromJson(Map<String, dynamic> json)
      : start = json['start'],
        stop = json['stop'],
        title = json['title'];

  Map<String, dynamic> toJson() =>
      {'start': start, 'stop': stop, 'title': title};
}
