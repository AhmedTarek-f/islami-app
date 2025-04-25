import 'package:islami_app/features/time/data/models/time_model/date.dart';
import 'package:islami_app/features/time/data/models/time_model/timings.dart';

class TimeModel {
  TimeModel({
    this.timings,
    this.date,
  });

  TimeModel.fromJson(dynamic json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
  }
  Timings? timings;
  Date? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (timings != null) {
      map['timings'] = timings?.toJson();
    }
    if (date != null) {
      map['date'] = date?.toJson();
    }
    return map;
  }
}
