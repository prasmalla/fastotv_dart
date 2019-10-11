class MovieInfo {
  final List<String> urls;
  final String description;
  final String display_name;
  final String preview_icon;

  MovieInfo(this.urls, this.description, this.display_name, this.preview_icon);

  MovieInfo.fromJson(Map<String, dynamic> json)
      : urls = json['urls'],
        description = json['description'],
        display_name = json['display_name'],
        preview_icon = json['preview_icon'] {}

  Map<String, dynamic> toJson() => {
        'urls': urls,
        'description': description,
        'display_name': display_name,
        'preview_icon': preview_icon
      };
}
