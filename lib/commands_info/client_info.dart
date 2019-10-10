class OperationSystemInfo {
  final String name;
  final String version;
  final String arch;

  final int ram_total;
  final int ram_free;

  OperationSystemInfo(
      this.name, this.version, this.arch, this.ram_total, this.ram_free);

  factory OperationSystemInfo.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final version = json['version'];
    final arch = json['arch'];
    final ram_total = json['ram_total'];
    final ram_free = json['ram_free'];
    return OperationSystemInfo(name, version, arch, ram_total, ram_free);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'version': version,
        'arch': arch,
        'ram_total': ram_total,
        'ram_free': ram_free
      };
}

class Project {
  final String name;
  final String version;

  Project(this.name, this.version);

  factory Project.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final version = json['version'];
    return Project(name, version);
  }

  Map<String, dynamic> toJson() => {'name': name, 'version': version};
}

class ClientInfo {
  final String login;
  final String device_id;
  final Project project;
  final OperationSystemInfo os;
  final String cpu_brand;
  final int bandwidth;

  ClientInfo(this.login, this.device_id, this.project, this.os, this.cpu_brand,
      this.bandwidth);

  factory ClientInfo.fromJson(Map<String, dynamic> json) {
    final login = json['login'];
    final device_id = json['device_id'];
    final project = Project.fromJson(json['project']);
    final os = OperationSystemInfo.fromJson(json['os']);
    final cpu_brand = json['cpu_brand'];
    final bandwidth = json['bandwidth'];
    return ClientInfo(login, device_id, project, os, cpu_brand, bandwidth);
  }

  Map<String, dynamic> toJson() => {
        'login': login,
        'device_id': device_id,
        'project': project.toJson(),
        'os': os.toJson(),
        'cpu_brand': cpu_brand,
        'bandwidth': bandwidth
      };
}
