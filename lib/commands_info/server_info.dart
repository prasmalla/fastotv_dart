class ServerInfo {
  final String epg_url;

  ServerInfo(this.epg_url);

  factory ServerInfo.fromJson(Map<String, dynamic> json) {
    final epg_url = json['epg_url'];
    return ServerInfo(epg_url);
  }

  Map<String, dynamic> toJson() => {'epg_url': epg_url};
}
