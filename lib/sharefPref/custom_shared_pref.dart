import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefCustom {
  static SharedPreferences? _prefs;

  static setStringToPref(String key, var value) async {
    SharedPreferences sharedPreferences = await getShared();
    sharedPreferences.setString(key, value);
  }

  static setMapToPref(String key, var value) async {
    setStringToPref(key, json.encode(value));
  }

  static Future<dynamic> getMapFromPref(String key) async {
    String? data = await getStringFromPref(key);
    if (data == null) {
      return null;
    }
    return json.decode(data);
  }

  static setIntToPref(String key, var value) async {
    SharedPreferences sharedPreferences = await getShared();
    sharedPreferences.setInt(key, value);
  }

  static setBoolToPref(String key, var value) async {
    SharedPreferences sharedPreferences = await getShared();
    sharedPreferences.setBool(key, value);
  }

  static Future<bool?> getBoolFromPref(String key) async {
    SharedPreferences sharedPreferences = await getShared();
    return sharedPreferences.getBool(key);
  }

  static Future<int?> getIntFromPref(String key) async {
    SharedPreferences sharedPreferences = await getShared();
    return sharedPreferences.getInt(key);
  }

  static Future<String?> getStringFromPref(String key) async {
    String? value;

    try {
      SharedPreferences sharedPreferences = await getShared();

      value = sharedPreferences.getString(key);
    } catch (e) {
      return null;
    }
    return value;
  }

  static Future<bool> hasPref(String key) async {
    SharedPreferences prefs = await getShared();
    return prefs.containsKey(key);
  }

  static removePref(String key) async {
    SharedPreferences prefs = await getShared();
    prefs.remove(key);
  }

  static Future<bool> clearAllPref() async {
    try {
      SharedPreferences prefs = await getShared();
      prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<SharedPreferences> getShared() async {
    return _prefs ?? await SharedPreferences.getInstance();
  }
}
