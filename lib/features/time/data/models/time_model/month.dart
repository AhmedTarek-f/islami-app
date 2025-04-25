class Month {
  Month({
    this.number,
    this.en,
  });

  Month.fromJson(dynamic json) {
    number = json['number'];
    en = json['en'];
  }
  num? number;
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['en'] = en;
    return map;
  }
}
