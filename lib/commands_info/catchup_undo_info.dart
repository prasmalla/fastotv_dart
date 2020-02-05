class CatchupUndoInfo {
  static const ID_FIELD = 'id';

  final String id;

  CatchupUndoInfo(this.id);

  factory CatchupUndoInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    return CatchupUndoInfo(id);
  }

  Map<String, dynamic> toJson() => {ID_FIELD: id};
}
