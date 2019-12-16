class InterruptStreamTimeInfo {
  static const ID_FIELD = 'id';
  static const TIME_FIELD = 'time';

  final String id;
  final int time;

  InterruptStreamTimeInfo(this.id, this.time);

  InterruptStreamTimeInfo.fromJson(Map<String, dynamic> json)
      : id = json[ID_FIELD],
        time = json[TIME_FIELD];

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, TIME_FIELD: time};
  }
}
