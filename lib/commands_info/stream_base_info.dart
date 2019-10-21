enum StreamBaseType { PUBLIC, PRIVATE }

StreamBaseType Type2Enum(int number) {
  if (number == 0) {
    return StreamBaseType.PUBLIC;
  }
  return StreamBaseType.PRIVATE;
}

class StreamBaseInfo {
  final String id;
  final StreamBaseType type;
  final String group;
  final bool video;
  final bool audio;

  StreamBaseInfo(this.id, this.type, this.group, this.video, this.audio);

  factory StreamBaseInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final type = Type2Enum(json['type']);
    final group = json['group'];
    final video = json['video'];
    final audio = json['audio'];
    return StreamBaseInfo(id, type, group, video, audio);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'type': type, 'group': group, 'video': video, 'audio': audio};
}
