import 'package:fastotv_dart/commands_info/programme_info.dart';

class EpgInfo {
  final String id;
  final String url;
  final String displayName;
  final String icon;
  List<ProgrammeInfo> programs = List<ProgrammeInfo>();

  EpgInfo(this.id, this.url, this.displayName, this.icon, this.programs);

  EpgInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        displayName = json['display_name'],
        icon = json['icon'] {
    List<dynamic> prog = json['programs'];
    prog.forEach((element) => (programs.add(ProgrammeInfo.fromJson(element))));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'display_name': displayName,
        'icon': icon,
        'programs': programs
      };
}
