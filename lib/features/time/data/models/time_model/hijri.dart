import 'package:islami_app/features/time/data/models/time_model/month_ar.dart';
import 'package:islami_app/features/time/data/models/time_model/weekday_ar.dart';

class Hijri {
  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
  });

  Hijri.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
        json['weekday'] != null ? WeekdayAr.fromJson(json['weekday']) : null;
    month = json['month'] != null ? MonthAr.fromJson(json['month']) : null;
    year = json['year'];
  }
  String? date;
  String? format;
  String? day;
  WeekdayAr? weekday;
  MonthAr? month;
  String? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['format'] = format;
    map['day'] = day;
    if (weekday != null) {
      map['weekday'] = weekday?.toJson();
    }
    if (month != null) {
      map['month'] = month?.toJson();
    }
    map['year'] = year;
    return map;
  }
}
