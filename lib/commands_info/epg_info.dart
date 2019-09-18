import 'package:fastotv_dart/commands_info/programme_info.dart';

class EpgInfo {
  final String id;
  final String url;
  final String display_name;
  final String icon;
  List<ProgrammeInfo> programs = List<ProgrammeInfo>();

  EpgInfo(this.id, this.url, this.display_name, this.icon, this.programs);

  EpgInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        display_name = json['display_name'],
        icon = json['icon'] {
    List<dynamic> prog = json['programs'];
    prog.forEach((element) => (programs.add(ProgrammeInfo.fromJson(element))));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'display_name': display_name,
        'icon': icon,
        'programs': programs
      };
}
