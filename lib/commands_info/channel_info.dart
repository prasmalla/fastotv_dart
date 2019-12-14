import 'package:fastotv_dart/commands_info/epg_info.dart';
import 'package:fastotv_dart/commands_info/stream_base_info.dart';

class ChannelInfo extends StreamBaseInfo {
  static const EPG_FIELD = 'epg';
  final EpgInfo epg;

  ChannelInfo(id, group, iarc, this.epg, video, audio, favorite)
      : super(id, group, iarc, video, audio, favorite) {}

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
    return ChannelInfo(
        base.id, base.group, base.iarc, epg, base.video, base.audio, base.favorite);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base[EPG_FIELD] = epg.toJson();
    return base;
  }
}
