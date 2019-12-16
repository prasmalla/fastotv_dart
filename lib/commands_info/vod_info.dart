import 'package:fastotv_dart/commands_info/movie_info.dart';
import 'package:fastotv_dart/commands_info/stream_base_info.dart';

class VodInfo extends StreamBaseInfo {
  static const VOD_FIELD = 'vod';

  final MovieInfo vod;

  VodInfo(
      id, group, iarc, favorite, recent, interrupt_time, this.vod, video, audio)
      : super(
            id, group, iarc, favorite, recent, interrupt_time, video, audio) {}

  String primaryLink() {
    return vod.urls[0];
  }

  String displayName() {
    return vod.display_name;
  }

  String getIcon() {
    return vod.preview_icon;
  }

  double getUserScore() {
    return vod.user_score;
  }

  int getDuration() {
    return vod.duration;
  }

  int getDate() {
    return vod.prime_date;
  }

  String getTrailerUrl() {
    return vod.trailer_url;
  }

  String getCountry() {
    return vod.country;
  }

  factory VodInfo.fromJson(Map<String, dynamic> json) {
    final base = StreamBaseInfo.fromJson(json);
    final vod = MovieInfo.fromJson(json[VOD_FIELD]);
    return VodInfo(base.id, base.group, base.iarc, base.favorite, base.recent,
        base.interrupt_time, vod, base.video, base.audio);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base[VOD_FIELD] = vod.toJson();
    return base;
  }
}
