class Weekday {
  Weekday({
    this.en,
  });

  Weekday.fromJson(dynamic json) {
    en = json['en'];
  }
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    return map;
  }
}
