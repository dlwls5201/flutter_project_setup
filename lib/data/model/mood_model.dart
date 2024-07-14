class MoodModel {
  final String icon, contents, creatorUid;
  final int createdAtMillisecond; // millisecond

  MoodModel({
    required this.icon,
    required this.contents,
    required this.creatorUid,
    required this.createdAtMillisecond,
  });

  Map<String, dynamic> toJson() {
    return {
      "icon": icon,
      "contents": contents,
      "creatorUid": creatorUid,
      "createdAtMillisecond": createdAtMillisecond,
    };
  }

  MoodModel.fromJson(Map<String, dynamic> json)
      : icon = json["icon"],
        contents = json["contents"],
        creatorUid = json["creatorUid"],
        createdAtMillisecond = json["createdAtMillisecond"];

  String getDocId() => "$creatorUid.$createdAtMillisecond";
}
