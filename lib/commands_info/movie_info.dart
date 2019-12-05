enum MovieType { VODS, SERIES }

MovieType Type2Enum(int number) {
  if (number == 0) {
    return MovieType.VODS;
  }
  return MovieType.SERIES;
}

class MovieInfo {
  static const URLS_FIELD = 'urls';
  static const DESCRIPTION_FIELD = 'description';
  static const DISPLAY_NAME_FIELD = 'display_name';
  static const PREVIEW_ICON_FIELD = 'preview_icon';
  static const TRAILER_URL_FIELD = 'trailer_url';
  static const USER_SCORE_FIELD = 'user_score';
  static const PRIME_DATE_FIELD = 'prime_date';
  static const COUNTRY_FIELD = 'country';
  static const DURATION_FIELD = 'duration';
  static const TYPE_FIELD = 'type';

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
    final urls = json[URLS_FIELD].cast<String>();
    final description = json[DESCRIPTION_FIELD];
    final display_name = json[DISPLAY_NAME_FIELD];
    final preview_icon = json[PREVIEW_ICON_FIELD];
    final trailer_url = json[TRAILER_URL_FIELD];
    final user_score = json[USER_SCORE_FIELD];
    final prime_date = json[PRIME_DATE_FIELD];
    final country = json[COUNTRY_FIELD];
    final duration = json[DURATION_FIELD];
    final type = Type2Enum(json[TYPE_FIELD]);
    return MovieInfo(urls, description, display_name, preview_icon, trailer_url,
        user_score, prime_date, country, duration, type);
  }

  Map<String, dynamic> toJson() => {
        URLS_FIELD: urls,
        DESCRIPTION_FIELD: description,
        DISPLAY_NAME_FIELD: display_name,
        PREVIEW_ICON_FIELD: preview_icon,
        TRAILER_URL_FIELD: trailer_url,
        USER_SCORE_FIELD: user_score,
        PRIME_DATE_FIELD: prime_date,
        COUNTRY_FIELD: country,
        DURATION_FIELD: duration,
        TYPE_FIELD: type
      };
}
