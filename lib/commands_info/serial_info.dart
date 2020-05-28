class Serial {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';
  static const ICON_FIELD = 'icon';
  static const GROUPS_FIELD = 'groups';
  static const DESCRIPTION_FIELD = 'description';
  static const SEASON_FIELD = 'season';
  static const EPISODES_FIELD = 'episodes';

  String id;
  String name;
  String icon;
  List<String> groups;
  String description;
  int season;
  List<String> episodes;

  Serial(this.id, this.name, this.icon, this.groups, this.description, this.season, this.episodes);

  Serial copy() {
    return Serial(id, name, icon, groups, description, season, episodes);
  }

  factory Serial.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final name = json[NAME_FIELD];
    final icon = json[ICON_FIELD];
    final List<String> groups = json[GROUPS_FIELD].cast<String>();
    final description = json[DESCRIPTION_FIELD];
    final season = json[SEASON_FIELD];
    final List<String> episodes = json[EPISODES_FIELD].cast<String>();
    return Serial(id, name, icon, groups, description, season, episodes);
  }

  Map<String, dynamic> toJson() {
    return {
      ID_FIELD: id,
      NAME_FIELD: name,
      ICON_FIELD: icon,
      GROUPS_FIELD: groups,
      DESCRIPTION_FIELD: description,
      SEASON_FIELD: season,
      EPISODES_FIELD: episodes
    };
  }
}
