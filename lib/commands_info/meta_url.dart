class MetaUrl {
  static const NAME_FIELD = 'name';
  static const URL_FIELD = 'url';

  final String name;
  final String url;

  MetaUrl(this.name, this.url);

  factory MetaUrl.fromJson(Map<String, dynamic> json) {
    final name = json[NAME_FIELD];
    final url = json[URL_FIELD];
    return MetaUrl(name, url);
  }

  Map<String, dynamic> toJson() {
    return {NAME_FIELD: name, URL_FIELD: url};
  }
}
