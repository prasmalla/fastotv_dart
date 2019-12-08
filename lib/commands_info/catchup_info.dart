import 'package:fastotv_dart/commands_info/channel_info.dart';

class CatchupInfo extends ChannelInfo {
  CatchupInfo(id, group, iarc, epg, video, audio)
      : super(id, group, iarc, epg, video, audio);

  factory CatchupInfo.fromJson(Map<String, dynamic> json) {
    final base = ChannelInfo.fromJson(json);
    return CatchupInfo(
        base.id, base.group, base.iarc, base.epg, base.video, base.audio);
  }

  Map<String, dynamic> toJson() {
    return super.toJson();
  }
}
