class InterruptStreamTimeInfo {
  static const ID_FIELD = 'id';
  static const TIME_FIELD = 'time';

  final String id;
  final int time;

  InterruptStreamTimeInfo(this.id, this.time);

  factory InterruptStreamTimeInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final time = json[TIME_FIELD];
    return InterruptStreamTimeInfo(id, time);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, TIME_FIELD: time};
  }
}
