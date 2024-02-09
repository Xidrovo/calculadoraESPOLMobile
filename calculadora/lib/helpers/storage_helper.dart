import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  Future<bool> saveSubjectData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
    return true;
  }

  Future<String> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<Set<String>> getAllKeys() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getKeys();
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> clearSubject(String keyId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(keyId);
  }
}
