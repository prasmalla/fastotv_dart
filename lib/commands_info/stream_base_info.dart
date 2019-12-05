class StreamBaseInfo {
  static const ID_FIELD = 'id';
  static const GROUP_FIELD = 'group';
  static const VIDEO_FIELD = 'video';
  static const AUDIO_FIELD = 'audio';

  final String id;
  final String group;
  final bool video;
  final bool audio;

  StreamBaseInfo(this.id, this.group, this.video, this.audio);

  factory StreamBaseInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final group = json[GROUP_FIELD];
    final video = json[VIDEO_FIELD];
    final audio = json[AUDIO_FIELD];
    return StreamBaseInfo(id, group, video, audio);
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      GROUP_FIELD: group,
      VIDEO_FIELD: video,
      AUDIO_FIELD: audio
    };
  }
}
