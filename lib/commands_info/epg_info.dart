import 'package:fastotv_dart/commands_info/programme_info.dart';

import 'package:quiver/core.dart';

class EpgInfo {
  final String id;
  final List<String> urls;
  final String display_name;
  final String icon;
  List<ProgrammeInfo> programs = List<ProgrammeInfo>();

  EpgInfo(this.id, this.urls, this.display_name, this.icon, this.programs);

  EpgInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        urls = json['urls'].cast<String>(),
        display_name = json['display_name'],
        icon = json['icon'] {
    List<dynamic> prog = json['programs'];
    prog.forEach((element) => (programs.add(ProgrammeInfo.fromJson(element))));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'urls': urls,
        'display_name': display_name,
        'icon': icon,
        'programs': programs
      };

  Optional<ProgrammeInfo> FindProgrammeByTime(int time) {
    for (final pr in programs) {
      if (time >= pr.start && time <= pr.stop) {
        return Optional<ProgrammeInfo>.of(pr);
      }
    }

    return Optional<ProgrammeInfo>.absent();
  }
}
