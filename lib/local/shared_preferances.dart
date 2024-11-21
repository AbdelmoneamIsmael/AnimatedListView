import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

 static late SharedPreferences sharedPreference;
  static Future<void> init() async {
    sharedPreference = await SharedPreferences.getInstance();
    CacheHelper.getData(key: CacheKey.lightTheme) ??
        CacheHelper.saveData(key: CacheKey.lightTheme, value: true);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await sharedPreference.setInt(key, value);
    }
    if (value is String) {
      return await sharedPreference.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreference.setBool(key, value);
    }
    return await sharedPreference.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreference.get(key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreference.remove(key);
  }

}
abstract class CacheKey{
 static const lightTheme = "lightTheme";
}