import 'package:fastotv_dart/commands_info/epg_info.dart';

enum Type {
  PUBLIC,
  PRIVATE,
}

enum StreamType {
  PROXY,
  RELAY,
  ENCODE,
  TIMESHIFT_PLAYER,
  TIMESHIFT_RECORDER,
  CATCHUP,
  TEST_LIFE,
  VOD_RELAY,
  VOD_ENCODE,
  COD_RELAY,
  COD_ENCODE,
}

Type Type2Enum(int number) {
  if (number == 0) {
    return Type.PUBLIC;
  }
  return Type.PRIVATE;
}

StreamType StreamType2Enum(int number) {
  if (number == 0) {
    return StreamType.PROXY;
  } else if (number == 1) {
    return StreamType.RELAY;
  } else if (number == 2) {
    return StreamType.ENCODE;
  } else if (number == 3) {
    return StreamType.TIMESHIFT_PLAYER;
  } else if (number == 4) {
    return StreamType.TIMESHIFT_RECORDER;
  } else if (number == 5) {
    return StreamType.CATCHUP;
  } else if (number == 6) {
    return StreamType.TEST_LIFE;
  } else if (number == 7) {
    return StreamType.VOD_RELAY;
  } else if (number == 8) {
    return StreamType.VOD_ENCODE;
  } else if (number == 9) {
    return StreamType.COD_RELAY;
  }
  return StreamType.COD_ENCODE;
}

class ChannelInfo {
  final String id;
  final Type type;
  final StreamType stream_type;
  final String group;
  final String description;
  final String preview_icon;
  final EpgInfo epg;
  final bool video;
  final bool audio;

  ChannelInfo(this.id, this.type, this.stream_type, this.group,
      this.description, this.preview_icon, this.epg, this.video, this.audio);

  factory ChannelInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final type = Type2Enum(json['type']);
    final stream_type = StreamType2Enum(json['stream_type']);
    final group = json['group'];
    final description = json['description'];
    final preview_icon = json['preview_icon'];
    final epg = EpgInfo.fromJson(json['epg']);
    final video = json['video'];
    final audio = json['audio'];
    return ChannelInfo(id, type, stream_type, group, description, preview_icon,
        epg, video, audio);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'stream_type': stream_type,
        'group': group,
        'description': description,
        'preview_icon': preview_icon,
        'epg': epg.toJson(),
        'video': video,
        'audio': audio
      };
}
