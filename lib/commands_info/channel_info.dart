import 'package:fastotv_dart/commands_info/epg_info.dart';
import 'package:fastotv_dart/commands_info/stream_base_info.dart';

class ChannelInfo extends StreamBaseInfo {
  static const EPG_FIELD = 'epg';
  final EpgInfo epg;

  ChannelInfo(id, group, this.epg, video, audio)
      : super(id, group, video, audio) {}

  String displayName() {
    return epg.display_name;
  }

  String primaryLink() {
    return epg.urls[0];
  }

  String getIcon() {
    return epg.icon;
  }

  factory ChannelInfo.fromJson(Map<String, dynamic> json) {
    final base = StreamBaseInfo.fromJson(json);
    final epg = EpgInfo.fromJson(json[EPG_FIELD]);
    return ChannelInfo(base.id, base.group, epg, base.video, base.audio);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base[EPG_FIELD] = epg.toJson();
    return base;
  }
}
