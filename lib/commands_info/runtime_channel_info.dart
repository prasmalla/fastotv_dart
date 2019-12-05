class RuntimeChannelLiteInfo {
  static const ID_FIELD = 'id';
  final String id;

  RuntimeChannelLiteInfo(this.id);

  factory RuntimeChannelLiteInfo.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    return RuntimeChannelLiteInfo(id);
  }

  Map<String, dynamic> toJson() => {ID_FIELD: id};
}

class RuntimeChannelInfo extends RuntimeChannelLiteInfo {
  static const WATCHERS_FIELD = 'watchers';
  final int watchers;

  RuntimeChannelInfo(id, this.watchers) : super(id);

  factory RuntimeChannelInfo.fromJson(Map<String, dynamic> json) {
    final run = RuntimeChannelLiteInfo.fromJson(json);
    final watchers = json[WATCHERS_FIELD];
    return RuntimeChannelInfo(run.id, watchers);
  }

  Map<String, dynamic> toJson() {
    return {RuntimeChannelLiteInfo.ID_FIELD: id, WATCHERS_FIELD: watchers};
  }
}
