import 'package:fastotv_dart/commands_info/meta_url.dart';

class StreamBaseInfo {
  static const ID_FIELD = 'id';
  static const GROUPS_FIELD = 'groups';
  static const IARC_FIELD = 'iarc';
  static const FAVORITE_FIELD = 'favorite';
  static const RECENT_FIELD = 'recent';
  static const INTERRUPT_TIME_FIELD = 'interrupt_time';
  static const LOCKED_FIELD = 'locked';
  static const VIDEO_FIELD = 'video';
  static const AUDIO_FIELD = 'audio';
  static const PARTS_FIELD = 'parts';
  static const VIEW_COUNT_FIELD = 'view_count';
  static const META_FIELD = 'meta';

  String id;
  List<String> groups;
  int iarc;
  bool favorite;
  int recent;
  int interrupt_time;
  bool locked;
  final int view_count;
  final bool video;
  final bool audio;
  final List<String> parts;
  final List<MetaUrl> meta;

  StreamBaseInfo(this.id, this.groups, this.iarc, this.favorite, this.recent, this.interrupt_time, this.locked,
      this.video, this.audio, this.parts, this.view_count, this.meta);

  factory StreamBaseInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final groups = json[GROUPS_FIELD].cast<String>();
    final iarc = json[IARC_FIELD];
    final favorite = json[FAVORITE_FIELD];
    final recent = json[RECENT_FIELD];
    final interrupt_time = json[INTERRUPT_TIME_FIELD];
    final locked = json[LOCKED_FIELD];
    final video = json[VIDEO_FIELD];
    final audio = json[AUDIO_FIELD];
    final parts = json[PARTS_FIELD].cast<String>();
    final view_count = json[VIEW_COUNT_FIELD];
    final meta = json[META_FIELD];
    final List<MetaUrl> resultMeta = [];
    meta?.forEach((item) => resultMeta.add(MetaUrl.fromJson(item)));

    return StreamBaseInfo(
        id, groups, iarc, favorite, recent, interrupt_time, locked, video, audio, parts, view_count, resultMeta);
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      GROUPS_FIELD: groups,
      FAVORITE_FIELD: favorite,
      RECENT_FIELD: recent,
      INTERRUPT_TIME_FIELD: interrupt_time,
      LOCKED_FIELD: locked,
      VIDEO_FIELD: video,
      AUDIO_FIELD: audio,
      PARTS_FIELD: parts,
      VIEW_COUNT_FIELD: view_count,
      META_FIELD: meta
    };
  }
}
