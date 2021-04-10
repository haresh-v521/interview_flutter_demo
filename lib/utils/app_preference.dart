
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences prefs;

  static void init() async {
    prefs = await SharedPreferences.getInstance();
    print("Pref Init");
  }

  static set(String key, dynamic value) {
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is int) {
      prefs.setInt(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    }
  }

  static getString(String key) {
    return prefs.getString(key);
  }

  static getInt(String key) {
    return prefs.getInt(key);
  }

  static getDouble(String key) {
    return prefs.getDouble(key);
  }

  static getBool(String key) {
    return prefs.getBool(key)??false;
  }

  static remove(String key) {
    prefs.remove(key);
  }

  static clear() {
    prefs.clear();
  }
}
