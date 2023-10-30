import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

///shared preferences
class CacheHelper {
  static SharedPreferences? preferences;

  ///init shared preferences
  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  ///get data
  static dynamic getData({required String key}) {
    return preferences!.get(key);
  }

  ///set data
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await preferences!.setString(key, value);
    if (value is int) return await preferences!.setInt(key, value);
    if (value is bool) return await preferences!.setBool(key, value);
    return await preferences!.setDouble(key, value);
  }

  ///clear data
  static Future<bool> clearData() {
    return preferences!.clear();
  }

  ///remove data
  static Future<bool> removeData({required key}) {
    return preferences!.remove(key);
  }
}
