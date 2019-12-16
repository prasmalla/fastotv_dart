class StreamBaseInfo {
  static const ID_FIELD = 'id';
  static const GROUP_FIELD = 'group';
  static const IARC_FIELD = 'iarc';
  static const FAVORITE_FIELD = 'favorite';
  static const RECENT_FIELD = 'recent';
  static const INTERRUPT_TIME_FIELD = 'interrupt_time';
  static const VIDEO_FIELD = 'video';
  static const AUDIO_FIELD = 'audio';

  final String id;
  final String group;
  final int iarc;
  bool favorite;
  bool recent;
  int interrupt_time;
  final bool video;
  final bool audio;

  StreamBaseInfo(this.id, this.group, this.iarc, this.favorite, this.recent,
      this.interrupt_time, this.video, this.audio);

  factory StreamBaseInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final group = json[GROUP_FIELD];
    final iarc = json[IARC_FIELD];
    final favorite = json[FAVORITE_FIELD];
    final recent = json[RECENT_FIELD];
    final interrupt_time = json[INTERRUPT_TIME_FIELD];
    final video = json[VIDEO_FIELD];
    final audio = json[AUDIO_FIELD];
    return StreamBaseInfo(
        id, group, iarc, favorite, recent, interrupt_time, video, audio);
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      GROUP_FIELD: group,
      FAVORITE_FIELD: favorite,
      RECENT_FIELD: recent,
      INTERRUPT_TIME_FIELD: interrupt_time,
      VIDEO_FIELD: video,
      AUDIO_FIELD: audio
    };
  }
}
