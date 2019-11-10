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
  final String trailer_url;
  final double user_score;
  final int prime_date;
  final String country;
  final int duration;
  final MovieType type;

  MovieInfo(
      this.urls,
      this.description,
      this.display_name,
      this.preview_icon,
      final this.trailer_url,
      this.user_score,
      this.prime_date,
      this.country,
      this.duration,
      this.type);

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    final urls = json['urls'].cast<String>();
    final description = json['description'];
    final display_name = json['display_name'];
    final preview_icon = json['preview_icon'];
    final trailer_url = json['trailer_url'];
    final user_score = json['user_score'];
    final prime_date = json['prime_date'];
    final country = json['country'];
    final duration = json['duration'];
    final type = Type2Enum(json['type']);
    return MovieInfo(urls, description, display_name, preview_icon, trailer_url,
        user_score, prime_date, country, duration, type);
  }

  Map<String, dynamic> toJson() => {
        'urls': urls,
        'description': description,
        'display_name': display_name,
        'preview_icon': preview_icon,
        'trailer_url': trailer_url,
        'user_score': user_score,
        'prime_date': prime_date,
        'country': country,
        'duration': duration,
        'type': type
      };
}
