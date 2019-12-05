class OperationSystemInfo {
  static const NAME_FIELD = 'name';
  static const VERSION_FILED = 'version';
  static const ARCH_FIELD = 'arch';
  static const RAM_TOTAL_FIELD = 'ram_total';
  static const RAM_FREE_FIELD = 'ram_free';

  final String name;
  final String version;
  final String arch;

  final int ram_total;
  final int ram_free;

  OperationSystemInfo(this.name, this.version, this.arch, this.ram_total,
      this.ram_free);

  factory OperationSystemInfo.fromJson(Map<String, dynamic> json) {
    final name = json[NAME_FIELD];
    final version = json[VERSION_FILED];
    final arch = json[ARCH_FIELD];
    final ram_total = json[RAM_TOTAL_FIELD];
    final ram_free = json[RAM_FREE_FIELD];
    return OperationSystemInfo(name, version, arch, ram_total, ram_free);
  }

  Map<String, dynamic> toJson() {
    return {
      NAME_FIELD: name,
      VERSION_FILED: version,
      ARCH_FIELD: arch,
      RAM_TOTAL_FIELD: ram_total,
      RAM_FREE_FIELD: ram_free
    };
  }
}

class Project {
  static const NAME_FIELD = 'name';
  static const VERSION_FILED = 'version';

  final String name;
  final String version;

  Project(this.name, this.version);

  factory Project.fromJson(Map<String, dynamic> json) {
    final name = json[NAME_FIELD];
    final version = json[VERSION_FILED];
    return Project(name, version);
  }

  Map<String, dynamic> toJson() {
    return {NAME_FIELD: name, VERSION_FILED: version}
  }
}

class ClientInfo {
  static const LOGIN_FILED = 'login';
  static const DEVICE_ID_FILED = 'device_id';
  static const PROJECT_FILED = 'project';
  static const OS_FILED = 'os';
  static const CPU_BRAND_FILED = 'cpu_brand';

  final String login;
  final String device_id;
  final Project project;
  final OperationSystemInfo os;
  final String cpu_brand;

  ClientInfo(this.login, this.device_id, this.project, this.os, this.cpu_brand);

  factory ClientInfo.fromJson(Map<String, dynamic> json) {
    final login = json[LOGIN_FILED];
    final device_id = json[DEVICE_ID_FILED];
    final project = Project.fromJson(json[PROJECT_FILED]);
    final os = OperationSystemInfo.fromJson(json[OS_FILED]);
    final cpu_brand = json[CPU_BRAND_FILED];
    return ClientInfo(login, device_id, project, os, cpu_brand);
  }

  Map<String, dynamic> toJson() {
    return {
      LOGIN_FILED: login,
      DEVICE_ID_FILED: device_id,
      PROJECT_FILED: project.toJson(),
      OS_FILED: os.toJson(),
      CPU_BRAND_FILED: cpu_brand
    };
  }
}
