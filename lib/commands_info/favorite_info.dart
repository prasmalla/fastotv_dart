class FavoriteInfo {
  static const ID_FIELD = 'id';
  static const FAVORITE_FIELD = 'favorite';

  final String id;
  final bool favorite;

  FavoriteInfo(this.id, this.favorite);

  factory FavoriteInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final favorite = json[FAVORITE_FIELD];
    return FavoriteInfo(id, favorite);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, FAVORITE_FIELD: favorite};
  }
}
