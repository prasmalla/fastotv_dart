class StreamBaseInfo {
  static const ID_FIELD = 'id';
  static const GROUP_FIELD = 'group';
  static const IARC_FIELD = 'iarc';
  static const VIDEO_FIELD = 'video';
  static const AUDIO_FIELD = 'audio';
  static const FAVORITE_FIELD = 'favorite';

  final String id;
  final String group;
  final int iarc;
  final bool video;
  final bool audio;
  bool favorite;

  StreamBaseInfo(this.id, this.group, this.iarc, this.video, this.audio, this.favorite);

  factory StreamBaseInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final group = json[GROUP_FIELD];
    final iarc = json[IARC_FIELD];
    final video = json[VIDEO_FIELD];
    final audio = json[AUDIO_FIELD];
    final favorite = json[FAVORITE_FIELD];
    return StreamBaseInfo(id, group, iarc, video, audio, favorite);
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      GROUP_FIELD: group,
      VIDEO_FIELD: video,
      AUDIO_FIELD: audio,
      FAVORITE_FIELD: favorite
    };
  }
}
