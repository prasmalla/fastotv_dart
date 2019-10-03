import 'package:fastotv_dart/commands_info/epg_info.dart';

class ChannelInfo {
  final String id;
  final int type;
  final int stream_type;
  final String group;
  final EpgInfo epg;
  final bool video;
  final bool audio;

  ChannelInfo(this.id, this.type, this.stream_type, this.group, this.epg,
      this.video, this.audio);

  factory ChannelInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final type = json['type'];
    final stream_type = json['stream_type'];
    final group = json['group'];
    final epg = EpgInfo.fromJson(json['epg']);
    final video = json['video'];
    final audio = json['audio'];
    return ChannelInfo(id, type, stream_type, group, epg, video, audio);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'stream_type': stream_type,
        'group': group,
        'epg': epg.toJson(),
        'video': video,
        'audio': audio
      };
}
