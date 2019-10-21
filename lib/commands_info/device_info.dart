class DeviceInfo {
  final String id;
  final String name;

  DeviceInfo(this.id, this.name);

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    return DeviceInfo(id, name);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
