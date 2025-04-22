class Moshaf {
  Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,});

  Moshaf.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    server = json['server'];
    surahTotal = json['surah_total'];
    moshafType = json['moshaf_type'];
    surahList = json['surah_list'];
  }
  num? id;
  String? name;
  String? server;
  num? surahTotal;
  num? moshafType;
  String? surahList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['server'] = server;
    map['surah_total'] = surahTotal;
    map['moshaf_type'] = moshafType;
    map['surah_list'] = surahList;
    return map;
  }

}