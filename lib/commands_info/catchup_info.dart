import 'package:fastotv_dart/commands_info/channel_info.dart';

class CatchupInfo extends ChannelInfo {
  static const START_FIELD = 'start';
  static const STOP_FIELD = 'stop';

  final int start;
  final int stop;

  CatchupInfo(id, groups, iarc, favorite, recent, interrupt_time, locked, epg, video, audio, parts, this.start,
      this.stop, view_count, meta)
      : super(id, groups, iarc, favorite, recent, interrupt_time, locked, epg, video, audio, parts, view_count, meta);

  factory CatchupInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final base = ChannelInfo.fromJson(json);
    final start = json[START_FIELD];
    final stop = json[STOP_FIELD];
    return CatchupInfo(base.id, base.groups, base.iarc, base.favorite, base.recent, base.interrupt_time, base.locked,
        base.epg, base.video, base.audio, base.parts, start, stop, base.view_count, base.meta);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base[START_FIELD] = start;
    base[STOP_FIELD] = stop;
    return base;
  }
}
