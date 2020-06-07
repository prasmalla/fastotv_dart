class DeviceInfo {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';

  final String id;
  final String name;

  DeviceInfo(this.id, this.name);

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final name = json[NAME_FIELD];
    return DeviceInfo(id, name);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, NAME_FIELD: name};
  }
}
