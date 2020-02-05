import 'package:fastotv_dart/commands_info/channel_info.dart';

class CatchupInfo extends ChannelInfo {
  static const START_FIELD = 'start';
  static const STOP_FIELD = 'stop';

  final int start;
  final int stop;

  CatchupInfo(id, group, iarc, favorite, recent, interrupt_time, epg, video, audio, parts, this.start, this.stop)
      : super(id, group, iarc, favorite, recent, interrupt_time, epg, video, audio, parts);

  factory CatchupInfo.fromJson(Map<String, dynamic> json) {
    final base = ChannelInfo.fromJson(json);
    final start = json[START_FIELD];
    final stop = json[STOP_FIELD];
    return CatchupInfo(base.id, base.group, base.iarc, base.favorite, base.recent, base.interrupt_time, base.epg,
        base.video, base.audio, base.parts, start, stop);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base[START_FIELD] = start;
    base[STOP_FIELD] = stop;
    return base;
  }
}
