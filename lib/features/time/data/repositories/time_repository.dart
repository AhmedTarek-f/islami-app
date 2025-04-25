import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islami_app/features/time/data/data_sources/remote_data_source/time_remote_data.dart';
import 'package:islami_app/features/time/data/models/azkar_model/azkar_model.dart';
import 'package:islami_app/features/time/data/models/time_model/time_model.dart';

abstract class TimeRepository {
  static TimeModel? cachedAdanData;
  static List<AzkarModel>? cachedEveningAzkar;
  static List<AzkarModel>? cachedMorningAzkar;
  static Future<TimeModel?> getAlAdanTimes({String? city}) async {
    try {
      return await TimeRemoteData.getAlAdanTimes(city: city);
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<AzkarModel>> loadMorningAzkarData() async {
    final String jsonString =
        await rootBundle.loadString('assets/files/azkar/azkar.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    List<AzkarModel> azkarList = [];

    var azkarData = jsonData['أذكار الصباح'];

    for (var item in azkarData) {
      if (item is List) {
        for (var subItem in item) {
          azkarList.add(AzkarModel.fromJson(subItem));
        }
      } else if (item is Map<String, dynamic>) {
        azkarList.add(AzkarModel.fromJson(item));
      }
    }

    return azkarList
        .where(
          (azkar) => azkar.category.trim().toLowerCase() != "stop",
        )
        .toList();
  }

  static Future<List<AzkarModel>> loadEveningAzkarData() async {
    final String jsonString =
        await rootBundle.loadString('assets/files/azkar/azkar.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    List<AzkarModel> azkarList = [];

    var azkarData = jsonData['أذكار المساء'];

    for (var item in azkarData) {
      if (item is List) {
        for (var subItem in item) {
          azkarList.add(AzkarModel.fromJson(subItem));
        }
      } else if (item is Map<String, dynamic>) {
        azkarList.add(AzkarModel.fromJson(item));
      }
    }

    return azkarList
        .where(
          (azkar) => azkar.category.trim().toLowerCase() != "stop",
        )
        .toList();
  }
}
