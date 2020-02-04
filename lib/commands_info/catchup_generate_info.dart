import 'package:fastotv_dart/commands_info/catchup_info.dart';

class CatchupGenerateInfo {
  static const ID_FIELD = 'id';
  static const START_FIELD = 'start';
  static const STOP_FIELD = 'stop';
  static const RECORD_FIELD = 'record';

  final String id;
  final int start;
  final int stop;
  final bool record;

  CatchupGenerateInfo(this.id, this.start, this.stop, this.record);

  factory CatchupGenerateInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final start = json[START_FIELD];
    final stop = json[STOP_FIELD];
    final record = json[RECORD_FIELD];
    return CatchupGenerateInfo(id, start, stop, record);
  }

  Map<String, dynamic> toJson() =>
      {ID_FIELD: id, START_FIELD: start, STOP_FIELD: stop};
}

class CatchupQueueInfo {
  static const CATCHUP_FIELD = 'catchup';
  final CatchupInfo catchup;

  CatchupQueueInfo(this.catchup);

  factory CatchupQueueInfo.fromJson(Map<String, dynamic> json) {
    final catchup = CatchupInfo.fromJson(json[CATCHUP_FIELD]);
    return CatchupQueueInfo(catchup);
  }

  Map<String, dynamic> toJson() => {CATCHUP_FIELD: catchup.toJson()};
}
