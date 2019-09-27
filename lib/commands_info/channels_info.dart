import 'package:fastotv_dart/commands_info/epg_info.dart';

enum Type { PUBLIC, PRIVATE }

class ChannelInfo {
  final String id;
  final Type type;
  final EpgInfo epg;
  final bool video;
  final bool audio;

  ChannelInfo(this.id, this.type, this.epg, this.video, this.audio);

  ChannelInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        epg = EpgInfo.fromJson(json['epg']),
        video = json['video'],
        audio = json['audio'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'epg': epg.toJson(),
        'video': video,
        'audio': audio
      };
}
