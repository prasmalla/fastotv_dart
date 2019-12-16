class FavoriteInfo {
  static const ID_FIELD = 'id';
  static const FAVORITE_FIELD = 'favorite';

  final String id;
  final bool favorite;

  FavoriteInfo(this.id, this.favorite);

  FavoriteInfo.fromJson(Map<String, dynamic> json)
      : id = json[ID_FIELD],
        favorite = json[FAVORITE_FIELD];

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, FAVORITE_FIELD: favorite};
  }
}
