import 'package:fastotv_dart/commands_info/epg_info.dart';
import 'package:fastotv_dart/commands_info/stream_base_info.dart';

class ChannelInfo extends StreamBaseInfo {
  static const EPG_FIELD = 'epg';
  final EpgInfo epg;

  ChannelInfo(
      id, groups, iarc, favorite, recent, interrupt_time, locked, this.epg, video, audio, parts, view_count, meta)
      : super(id, groups, iarc, favorite, recent, interrupt_time, locked, video, audio, parts, view_count, meta) {}

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
    if (json == null) {
      return null;
    }

    final base = StreamBaseInfo.fromJson(json);
    final epg = EpgInfo.fromJson(json[EPG_FIELD]);
    return ChannelInfo(base.id, base.groups, base.iarc, base.favorite, base.recent, base.interrupt_time, base.locked,
        epg, base.video, base.audio, base.parts, base.view_count, base.meta);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base[EPG_FIELD] = epg.toJson();
    return base;
  }
}
