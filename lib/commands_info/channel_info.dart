import 'package:fastotv_dart/commands_info/epg_info.dart';

class ChannelInfo {
  final String id;
  final int type;
  final int ui_type;
  final EpgInfo epg;
  final bool video;
  final bool audio;

  ChannelInfo(
      this.id, this.type, this.ui_type, this.epg, this.video, this.audio);

  factory ChannelInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final type = json['type'];
    final ui_type = json['ui_type'];
    final epg = EpgInfo.fromJson(json['epg']);
    final video = json['video'];
    final audio = json['audio'];
    return ChannelInfo(id, type, ui_type, epg, video, audio);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'ui_type': ui_type,
        'epg': epg.toJson(),
        'video': video,
        'audio': audio
      };
}
