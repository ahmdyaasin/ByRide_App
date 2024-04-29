import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  SharedPreferences prefs;

  PrefsHelper(this.prefs);

  Future<bool> clearData() async {
    await prefs.clear();
    return true;
  }

  saveToken(String Token) async {
    prefs.setString('TokenKey', Token);
  }

  saveString(String key, String value) {
    prefs.setString(key, value);
  }

  saveBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  String readString(String key) {
    return prefs.getString(key) ?? "";
  }

  bool readBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  readModel(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key) ?? '');
  }

  saveModel(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  removeModel(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  String get Token => prefs.getString('TokenKey') ?? "";
}
