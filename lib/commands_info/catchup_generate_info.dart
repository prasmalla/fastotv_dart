class CatchupGenerateInfo {
  static const ID_FIELD = 'id';
  static const START_FIELD = 'start';
  static const STOP_FIELD = 'stop';

  final String id;
  final int start;
  final int stop;

  CatchupGenerateInfo(this.id, this.start, this.stop);

  factory CatchupGenerateInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final start = json[START_FIELD];
    final stop = json[STOP_FIELD];
    return CatchupGenerateInfo(id, start, stop);
  }

  Map<String, dynamic> toJson() =>
      {ID_FIELD: id, START_FIELD: start, STOP_FIELD: stop};
}

class CatchupQueueInfo {
  static const ID_FIELD = 'cid';
  final String id;

  CatchupQueueInfo(this.id);

  factory CatchupQueueInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    return CatchupQueueInfo(id);
  }

  Map<String, dynamic> toJson() => {ID_FIELD: id};
}
