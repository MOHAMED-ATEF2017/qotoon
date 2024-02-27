import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static late SharedPreferences prefs;

  static Future<void> initialSharedPreference() async {
    await SharedPreferences.getInstance().then((value) => prefs = value);
  }

//***************  set data *********** */
  static Future<void> setString(
      {required String value, required String key}) async {
    await prefs.setString(key, value);
  }

  static Future<void> setListString(
      {required List<String> value, required String key}) async {
    await prefs.setStringList(key, value);
  }

  static Future<void> setBool(
      {required bool value, required String key}) async {
    await prefs.setBool(key, value);
  }

  static Future<void> setInt({required int value, required String key}) async {
    await prefs.setInt(key, value);
  }

  static Future<void> setDouble(
      {required double value, required String key}) async {
    await prefs.setDouble(key, value);
  }

  //************** get data ************* */
  static double? getDouble({required String key}) {
    return prefs.getDouble(key);
  }

  static String? getString({required String key}) {
    return prefs.getString(key);
  }

  static int? getInt({required String key}) {
    return prefs.getInt(key);
  }

  static bool? getBool({required String key}) {
    return prefs.getBool(key);
  }

  static List<String>? getStringList({required String key}) {
    return prefs.getStringList(key);
  }
}
