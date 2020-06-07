class RecentInfo {
  static const ID_FIELD = 'id';
  static const TIME_FIELD = 'time';

  final String id;
  final int time;

  RecentInfo(this.id, this.time);

  factory RecentInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final time = json[TIME_FIELD];
    return RecentInfo(id, time);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, TIME_FIELD: time};
  }
}
