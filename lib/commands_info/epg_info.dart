import 'package:fastotv_dart/commands_info/programme_info.dart';

import 'package:quiver/core.dart';

class EpgInfo {
  static const ID_FIELD = 'id';
  static const URLS_FIELD = 'urls';
  static const DISPLAY_NAME_FIELD = 'display_name';
  static const ICON_FIELD = 'icon';
  static const PROGRAMS_FIELD = 'programs';

  final String id;
  final List<String> urls;
  final String display_name;
  final String icon;
  List<ProgrammeInfo> programs = [];

  EpgInfo(this.id, this.urls, this.display_name, this.icon, this.programs);

  EpgInfo.fromJson(Map<String, dynamic> json)
      : id = json[ID_FIELD],
        urls = json[URLS_FIELD].cast<String>(),
        display_name = json[DISPLAY_NAME_FIELD],
        icon = json[ICON_FIELD] {
    List<dynamic> prog = json[PROGRAMS_FIELD];
    prog.forEach((element) => (programs.add(ProgrammeInfo.fromJson(element))));
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      URLS_FIELD: urls,
      DISPLAY_NAME_FIELD: display_name,
      ICON_FIELD: icon,
      PROGRAMS_FIELD: programs
    };
  }

  Optional<ProgrammeInfo> FindProgrammeByTime(int time) {
    for (final pr in programs) {
      if (time >= pr.start && time <= pr.stop) {
        return Optional<ProgrammeInfo>.of(pr);
      }
    }

    return Optional<ProgrammeInfo>.absent();
  }
}
