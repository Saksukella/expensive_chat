import '../s_prefs.dart';

String? readPrefString(String key) {
  return AppSharedPreferences.prefs.getString(key);
}

void writePrefString(String key, String value) {
  AppSharedPreferences.prefs.setString(key, value);
}

bool? readPrefBool(String key) {
  return AppSharedPreferences.prefs.getBool(key);
}

void writePrefBool(String key, bool value) {
  AppSharedPreferences.prefs.setBool(key, value);
}

int? readPrefInt(String key) {
  return AppSharedPreferences.prefs.getInt(key);
}

void writePrefInt(String key, int value) {
  AppSharedPreferences.prefs.setInt(key, value);
}

double? readPrefDouble(String key) {
  return AppSharedPreferences.prefs.getDouble(key);
}

void writePrefDouble(String key, double value) {
  AppSharedPreferences.prefs.setDouble(key, value);
}

List<String>? readPrefStringList(String key) {
  return AppSharedPreferences.prefs.getStringList(key);
}

void writePrefStringList(String key, List<String> value) {
  AppSharedPreferences.prefs.setStringList(key, value);
}
