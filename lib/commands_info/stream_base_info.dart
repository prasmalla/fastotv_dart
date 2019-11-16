class StreamBaseInfo {
  final String id;
  final String group;
  final bool video;
  final bool audio;

  StreamBaseInfo(this.id, this.group, this.video, this.audio);

  factory StreamBaseInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final group = json['group'];
    final video = json['video'];
    final audio = json['audio'];
    return StreamBaseInfo(id, group, video, audio);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'group': group, 'video': video, 'audio': audio};
}
