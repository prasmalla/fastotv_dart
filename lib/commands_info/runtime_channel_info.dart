class RuntimeChannelLiteInfo {
  final String id;

  RuntimeChannelLiteInfo(this.id);

  factory RuntimeChannelLiteInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    return RuntimeChannelLiteInfo(id);
  }

  Map<String, dynamic> toJson() => {'id': id};
}

class RuntimeChannelInfo extends RuntimeChannelLiteInfo {
  final int watchers;

  RuntimeChannelInfo(id, this.watchers) : super(id);

  factory RuntimeChannelInfo.fromJson(Map<String, dynamic> json) {
    final run = RuntimeChannelLiteInfo.fromJson(json);
    final watchers = json['watchers'];
    return RuntimeChannelInfo(run.id, watchers);
  }

  Map<String, dynamic> toJson() => {'id': id, 'watchers': watchers};
}
