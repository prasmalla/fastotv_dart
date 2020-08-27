class ServerInfo {
  static const EPG_URL_FIELD = 'epg_url';
  static const LOCKED_STREAM_TEXT_FIELD = 'locked_stream_text';
  final String epg_url;
  final String locked_stream_text;

  ServerInfo(this.epg_url, this.locked_stream_text);

  factory ServerInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final epg_url = json[EPG_URL_FIELD];
    final locked_stream_text = json[LOCKED_STREAM_TEXT_FIELD];
    return ServerInfo(epg_url, locked_stream_text);
  }

  Map<String, dynamic> toJson() {
    return {EPG_URL_FIELD: epg_url, LOCKED_STREAM_TEXT_FIELD: locked_stream_text};
  }
}
