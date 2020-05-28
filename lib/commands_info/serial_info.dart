class Serial {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';
  static const ICON_FIELD = 'icon';
  static const GROUPS_FIELD = 'groups';
  static const DESCRIPTION_FIELD = 'description';
  static const SEASON_FIELD = 'season';
  static const EPISODES_FIELD = 'episodes';
  static const VIEW_COUNT_FIELD = 'view_count';

  String id;
  String name;
  String icon;
  List<String> groups;
  String description;
  int season;
  List<String> episodes;
  final int view_count;

  Serial(this.id, this.name, this.icon, this.groups, this.description, this.season, this.episodes, this.view_count);

  Serial copy() {
    return Serial(id, name, icon, groups, description, season, episodes, view_count);
  }

  factory Serial.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final name = json[NAME_FIELD];
    final icon = json[ICON_FIELD];
    final List<String> groups = json[GROUPS_FIELD].cast<String>();
    final description = json[DESCRIPTION_FIELD];
    final season = json[SEASON_FIELD];
    final List<String> episodes = json[EPISODES_FIELD].cast<String>();
    final view_count = json[VIEW_COUNT_FIELD];
    return Serial(id, name, icon, groups, description, season, episodes, view_count);
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      NAME_FIELD: name,
      ICON_FIELD: icon,
      GROUPS_FIELD: groups,
      DESCRIPTION_FIELD: description,
      SEASON_FIELD: season,
      EPISODES_FIELD: episodes,
      VIEW_COUNT_FIELD: view_count
    };
  }
}
