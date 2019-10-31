import 'package:fastotv_dart/commands_info/epg_info.dart';
import 'package:fastotv_dart/commands_info/stream_base_info.dart';

class ChannelInfo extends StreamBaseInfo {
  final EpgInfo epg;

  ChannelInfo(id, type, group, this.epg, video, audio)
      : super(id, type, group, video, audio) {}

  String displayName() {
    return epg.display_name;
  }

  String primaryLink() {
    return epg.urls[0];
  }

  factory ChannelInfo.fromJson(Map<String, dynamic> json) {
    final base = StreamBaseInfo.fromJson(json);
    final epg = EpgInfo.fromJson(json['epg']);
    return ChannelInfo(
        base.id, base.type, base.group, epg, base.video, base.audio);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base['epg'] = epg.toJson();
    return base;
  }
}
