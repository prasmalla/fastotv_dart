class MetaUrl {
  static const NAME_FIELD = 'name';
  static const URL_FIELD = 'url';

  String name;
  String url;

  MetaUrl(this.name, this.url);

  MetaUrl copy() {
    return MetaUrl(name, url);
  }

  factory MetaUrl.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final name = json[NAME_FIELD];
    final url = json[URL_FIELD];
    return MetaUrl(name, url);
  }

  Map<String, dynamic> toJson() {
    return {NAME_FIELD: name, URL_FIELD: url};
  }
}
