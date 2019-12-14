class FavoriteInfo {
  static const CHANNEL_FIELD = 'channel';
  static const FAVORITE_FIELD = 'favorite';

  final String channel;
  final bool favorite;

  FavoriteInfo(this.channel, this.favorite);

  FavoriteInfo.fromJson(Map<String, dynamic> json)
      : channel = json[CHANNEL_FIELD],
        favorite = json[FAVORITE_FIELD];

  Map<String, dynamic> toJson() {
    return {
      CHANNEL_FIELD: channel,
      FAVORITE_FIELD: favorite,
    };
  }
}
