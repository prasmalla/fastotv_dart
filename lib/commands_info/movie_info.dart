class MovieInfo {
  final List<String> urls;
  final String description;
  final String preview_icon;

  MovieInfo(this.urls, this.description, this.preview_icon);

  MovieInfo.fromJson(Map<String, dynamic> json)
      : urls = json['urls'],
        description = json['description'],
        preview_icon = json['preview_icon'] {}

  Map<String, dynamic> toJson() =>
      {'urls': urls, 'description': description, 'preview_icon': preview_icon};
}
