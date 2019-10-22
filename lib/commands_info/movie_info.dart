enum MovieType { VODS, SERIES }

MovieType Type2Enum(int number) {
  if (number == 0) {
    return MovieType.VODS;
  }
  return MovieType.SERIES;
}

class MovieInfo {
  final List<String> urls;
  final String description;
  final String display_name;
  final String preview_icon;
  final MovieType type;

  MovieInfo(this.urls, this.description, this.display_name, this.preview_icon,
      this.type);

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    final urls = json['urls'].cast<String>();
    final description = json['description'];
    final display_name = json['display_name'];
    final preview_icon = json['preview_icon'];
    final type = Type2Enum(json['type']);
    return MovieInfo(urls, description, display_name, preview_icon, type);
  }

  Map<String, dynamic> toJson() => {
        'urls': urls,
        'description': description,
        'display_name': display_name,
        'preview_icon': preview_icon,
        'type': type
      };
}
