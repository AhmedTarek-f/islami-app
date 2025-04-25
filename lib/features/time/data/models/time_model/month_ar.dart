class MonthAr {
  MonthAr({
    this.number,
    this.en,
    this.ar,
    this.days,
  });

  MonthAr.fromJson(dynamic json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
    days = json['days'];
  }
  num? number;
  String? en;
  String? ar;
  num? days;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['en'] = en;
    map['ar'] = ar;
    map['days'] = days;
    return map;
  }
}