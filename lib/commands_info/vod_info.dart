import 'package:fastotv_dart/commands_info/movie_info.dart';
import 'package:fastotv_dart/commands_info/stream_base_info.dart';

class VodInfo extends StreamBaseInfo {
  final MovieInfo vod;

  VodInfo(id, type, group, this.vod, video, audio)
      : super(id, type, group, video, audio) {}

  String primaryLink() {
    return vod.urls[0];
  }

  String displayName() {
    return vod.display_name;
  }
  
  Widget getIcon(){
    return vod.preview_icon ==
                "https://fastocloud.com/static/images/unknown_preview.png"
            ? ClipRect(
                child: Icon(
                  Icons.tv,
                  size: 40,
                  color: Colors.grey,
                ),
              )
            : ClipRect(
                child: Image.network(
                  vod.preview_icon,
                  height: 40,
                  width: 40,
                ),
              );
  }

  factory VodInfo.fromJson(Map<String, dynamic> json) {
    final base = StreamBaseInfo.fromJson(json);
    final vod = MovieInfo.fromJson(json['vod']);
    return VodInfo(base.id, base.type, base.group, vod, base.video, base.audio);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> base = super.toJson();
    base['vod'] = vod.toJson();
    return base;
  }
}
