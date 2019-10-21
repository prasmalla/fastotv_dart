class ServerInfo {
  final String bandwidth_host;
  final String epg_url;

  ServerInfo(this.bandwidth_host, this.epg_url);

  factory ServerInfo.fromJson(Map<String, dynamic> json) {
    final bandwidth_host = json['bandwidth_host'];
    final epg_url = json['epg_url'];
    return ServerInfo(bandwidth_host, epg_url);
  }

  Map<String, dynamic> toJson() =>
      {'bandwidth_host': bandwidth_host, 'epg_url': epg_url};
}
