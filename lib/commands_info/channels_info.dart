import 'package:fastotv/commands_info/epg_info.dart';

class ChannelInfo {
  final String id;
  final EpgInfo epg;
  final bool video;
  final bool audio;

  ChannelInfo(this.id, this.epg, this.video, this.audio);

  ChannelInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        epg = EpgInfo.fromJson(json['epg']),
        video = json['video'],
        audio = json['audio'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'epg': epg.toJson(), 'video': video, 'audio': audio};
}
