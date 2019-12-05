class ServerInfo {
  static const EPG_URL_FIELD = 'epg_url';
  final String epg_url;

  ServerInfo(this.epg_url);

  factory ServerInfo.fromJson(Map<String, dynamic> json) {
    final epg_url = json[EPG_URL_FIELD];
    return ServerInfo(epg_url);
  }

  Map<String, dynamic> toJson() => {EPG_URL_FIELD: epg_url};
}
