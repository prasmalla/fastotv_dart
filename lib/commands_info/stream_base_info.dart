class StreamBaseInfo {
  static const ID_FIELD = 'id';
  static const GROUP_FIELD = 'group';
  static const IARC_FIELD = 'iarc';
  static const FAVORITE_FIELD = 'favorite';
  static const RECENT_FIELD = 'recent';
  static const INTERRUPT_TIME_FIELD = 'interrupt_time';
  static const VIDEO_FIELD = 'video';
  static const AUDIO_FIELD = 'audio';
  static const PARTS_FIELD = 'parts';
  static const VIEW_COUNT_FIELD = 'view_count';

  String id;
  String group;
  int iarc;
  bool favorite;
  int recent;
  int interrupt_time;
  final int view_count;
  final bool video;
  final bool audio;
  final List<String> parts;

  StreamBaseInfo(this.id, this.group, this.iarc, this.favorite, this.recent, this.interrupt_time, this.video,
      this.audio, this.parts, this.view_count);

  factory StreamBaseInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final group = json[GROUP_FIELD];
    final iarc = json[IARC_FIELD];
    final favorite = json[FAVORITE_FIELD];
    final recent = json[RECENT_FIELD];
    final interrupt_time = json[INTERRUPT_TIME_FIELD];
    final video = json[VIDEO_FIELD];
    final audio = json[AUDIO_FIELD];
    final parts = json[PARTS_FIELD].cast<String>();
    final view_count = json[VIEW_COUNT_FIELD];

    return StreamBaseInfo(id, group, iarc, favorite, recent, interrupt_time, video, audio, parts, view_count);
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      GROUP_FIELD: group,
      FAVORITE_FIELD: favorite,
      RECENT_FIELD: recent,
      INTERRUPT_TIME_FIELD: interrupt_time,
      VIDEO_FIELD: video,
      AUDIO_FIELD: audio,
      PARTS_FIELD: parts,
      VIEW_COUNT_FIELD: view_count
    };
  }
}
