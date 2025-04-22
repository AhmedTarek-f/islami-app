import 'package:islami_app/features/radio/data/models/reciters_model/moshaf.dart';

class ReciterModel {
  ReciterModel({
      required this.id,
      required this.name,
      required this.letter,
      required this.date,
      required this.moshaf,
      this.isPlaying = false,
      this.isSoundOn = true,
  });

  final int id;
  final String name;
  final String letter;
  final String date;
  List<Moshaf> moshaf;
  bool isPlaying;
  bool isSoundOn;

  static ReciterModel empty() => ReciterModel(id: 0, name: "", letter: "", date: "", moshaf: []);

  factory ReciterModel.fromJson(Map<String,dynamic> jsonData) {
    if(jsonData.isNotEmpty){
      List<Moshaf> moshafData = [];
      if (jsonData['moshaf'] != null) {
        jsonData['moshaf'].forEach((v) {
          moshafData.add(Moshaf.fromJson(v));
        });
      }
      return ReciterModel(
        id: jsonData['id'] as int,
        name: jsonData['name'] as String,
        letter: jsonData['letter'] as String,
        date: jsonData["date"] as String,
        moshaf: moshafData,
      );
    }
    else{
      return empty();
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['letter'] = letter;
    map['date'] = date;
    if (moshaf.isNotEmpty) {
      map['moshaf'] = moshaf.map((v) => v.toJson()).toList();
    }
    return map;
  }

}