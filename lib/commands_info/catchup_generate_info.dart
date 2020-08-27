import 'package:fastotv_dart/commands_info/catchup_info.dart';

class CatchupGenerateInfo {
  static const ID_FIELD = 'id';
  static const TITLE_FIELD = 'title';
  static const START_FIELD = 'start';
  static const STOP_FIELD = 'stop';

  final String id;
  final String title;
  final int start;
  final int stop;

  CatchupGenerateInfo(this.id, this.title, this.start, this.stop);

  factory CatchupGenerateInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final start = json[START_FIELD];
    final stop = json[STOP_FIELD];
    final title = json[TITLE_FIELD];
    return CatchupGenerateInfo(id, title, start, stop);
  }

  Map<String, dynamic> toJson() => {ID_FIELD: id, TITLE_FIELD: title, START_FIELD: start, STOP_FIELD: stop};
}

class CatchupQueueInfo {
  static const CATCHUP_FIELD = 'catchup';
  final CatchupInfo catchup;

  CatchupQueueInfo(this.catchup);

  factory CatchupQueueInfo.fromJson(Map<String, dynamic> json) {
    final catchup = CatchupInfo.fromJson(json[CATCHUP_FIELD]);
    if (catchup == null) {
      return null;
    }

    return CatchupQueueInfo(catchup);
  }

  Map<String, dynamic> toJson() {
    return {CATCHUP_FIELD: catchup.toJson()};
  }
}
