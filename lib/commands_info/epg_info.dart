import 'package:fastotv_dart/commands_info/programme_info.dart';
import 'package:quiver/core.dart';

class EpgInfo {
  static const ID_FIELD = 'id';
  static const URLS_FIELD = 'urls';
  static const DISPLAY_NAME_FIELD = 'display_name';
  static const ICON_FIELD = 'icon';
  static const PROGRAMS_FIELD = 'programs';

  String id;
  List<String> urls;
  String display_name;
  String icon;
  List<ProgrammeInfo> programs = [];

  EpgInfo(this.id, this.urls, this.display_name, this.icon, this.programs);

  factory EpgInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final urls = json[URLS_FIELD].cast<String>();
    final display_name = json[DISPLAY_NAME_FIELD];
    final icon = json[ICON_FIELD];
    List<ProgrammeInfo> programs = [];
    json[PROGRAMS_FIELD].forEach((element) {
      final ProgrammeInfo program = ProgrammeInfo.fromJson(element);
      if (program != null) {
        programs.add(program);
      }
    });
    return EpgInfo(id, urls, display_name, icon, programs);
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
