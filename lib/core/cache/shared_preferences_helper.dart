import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static removeData({required String key}) async {
    await sharedPreferences.remove(key);
  }

  static clearAllData() async {
    await sharedPreferences.clear();
  }

  static saveData({required String key, required dynamic value}) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");

    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else {
      return null;
    }
  }

  static getBool({required String key}) {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return sharedPreferences.getBool(key) ?? false;
  }

  static getDouble({required String key}) {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  static getInt({required String key}) {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return sharedPreferences.getInt(key) ?? 0;
  }

  static getString({required String key}) {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return sharedPreferences.getString(key) ?? '';
  }
}
