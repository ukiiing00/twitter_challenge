import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepository {
  static const String _darkmode = "darkmode";

  final SharedPreferences _preferences;

  DarkModeConfigRepository(this._preferences);

  Future<void> setDarkMode(bool darkmode) async {
    print("setDarkMode $darkmode");
    _preferences.setBool(_darkmode, darkmode);
  }

  bool isDarkMode() {
    return _preferences.getBool(_darkmode) ?? false;
  }
}
