class FavoriteInfo {
  static const ID_FIELD = 'id';
  static const FAVORITE_FIELD = 'favorite';
  static const PRIVATE_FIELD = 'private';

  final String id;
  final bool favorite;
  final bool private;

  FavoriteInfo(this.id, this.favorite, this.private);

  FavoriteInfo.fromJson(Map<String, dynamic> json)
      : id = json[ID_FIELD],
        favorite = json[FAVORITE_FIELD],
        private = json[PRIVATE_FIELD];

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, FAVORITE_FIELD: favorite, PRIVATE_FIELD: private};
  }
}
